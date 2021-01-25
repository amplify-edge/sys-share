package ops

import (
	"context"
	"github.com/getcouragenow/sys-share/sys-core/service/logging"
	"github.com/shirou/gopsutil/v3/disk"
	"github.com/shirou/gopsutil/v3/mem"
	"time"

	"github.com/shirou/gopsutil/v3/cpu"
	"github.com/shirou/gopsutil/v3/net"
)

type OpsSystemMonitor struct {
	ctx              context.Context
	logger           logging.Logger
	interval         time.Duration
	netStats         map[string]net.IOCountersStat // interface-name as key
	netStatsUpdated  map[string]time.Time          // last updated time
	systemStat       *SystemStat
	metricsDiskPath  string
	opsSystemMetrics *OpsSystemMetrics
}

// NewOpsSystemMonitor is the constructor for OpsSystemMonitor
// also registers system metrics and runtime metrics
func NewOpsSystemMonitor(ctx context.Context, interval time.Duration, metricsDiskPath string, logger logging.Logger) *OpsSystemMonitor {
	opsSystemMetrics := NewOpsSystemMetrics()
	if metricsDiskPath == "" {
		metricsDiskPath = "/"
	}
	return &OpsSystemMonitor{
		ctx:              ctx,
		logger:           logger,
		interval:         interval,
		netStats:         make(map[string]net.IOCountersStat),
		netStatsUpdated:  make(map[string]time.Time),
		systemStat:       &SystemStat{},
		metricsDiskPath:  metricsDiskPath,
		opsSystemMetrics: opsSystemMetrics,
	}
}

func (o *OpsSystemMonitor) Run() {
	ticker := time.NewTicker(o.interval)
	defer ticker.Stop()
	o.collectMetrics()
	for {
		select {
		case <-ticker.C:
			o.collectMetrics()
		case <-o.ctx.Done():
			return
		}
	}
}

func (o *OpsSystemMonitor) collectMetrics() {
	cpuStat, err := cpu.TimesWithContext(o.ctx, true)
	if err != nil {
		o.logger.Errorf("getting cpu time stats error: %v", err)
	}
	if cpuStat != nil && len(cpuStat) > 0 {
		o.systemStat.CPUTime = &cpuStat[0]
	}
	memstat, err := mem.VirtualMemoryWithContext(o.ctx)
	if err != nil {
		o.logger.Errorf("getting memory stats error: %v", err)
	}
	o.systemStat.MemoryStats = memstat
	dustat, err := disk.UsageWithContext(o.ctx, o.metricsDiskPath)
	if err != nil {
		o.logger.Errorf("getting disk usage error: %v", err)
	}
	o.systemStat.DiskStats = dustat
	netstats, err := net.IOCountersWithContext(o.ctx, true)
	for _, ns := range netstats {
		o.netStats[ns.Name] = ns
		o.netStatsUpdated[ns.Name] = time.Now()
	}
	o.updatePrometheusStats()
}

func (o *OpsSystemMonitor) updatePrometheusStats() {
	// CPU
	cpuStat := o.systemStat.CPUTime
	if cpuStat != nil {
		o.opsSystemMetrics.CpuStats.updatePrometheusStats(cpuStat)
	}

	// Memory
	memGauge := o.opsSystemMetrics.MemoryStats
	memstat := o.systemStat.MemoryStats
	memGauge.updatePrometheusStats(memstat)

	// Disk Usage
	diskGauge := o.opsSystemMetrics.DiskStats
	diskStat := o.systemStat.DiskStats
	diskGauge.updatePrometheusStats(diskStat)

	// Network
	netGauge := o.opsSystemMetrics.NetworkStats
	for _, ns := range o.netStats {
		lastStat, ok := o.netStats[ns.Name]
		if ok && time.Since(o.netStatsUpdated[ns.Name]) <= 2*o.interval {
			netGauge.updatePrometheusStats(lastStat, ns)
		}
		o.netStats[ns.Name] = ns
		o.netStatsUpdated[ns.Name] = time.Now()
	}
}
