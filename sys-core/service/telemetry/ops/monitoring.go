package ops

import (
	"context"
	"github.com/shirou/gopsutil/v3/disk"
	"github.com/shirou/gopsutil/v3/mem"
	"github.com/sirupsen/logrus"
	"time"

	"github.com/shirou/gopsutil/v3/cpu"
	"github.com/shirou/gopsutil/v3/net"
)

type OpsSystemMonitor struct {
	ctx              context.Context
	logger           *logrus.Entry
	interval         time.Duration
	netStats         map[string]net.IOCountersStat // interface-name as key
	netStatsUpdated  map[string]time.Time          // last updated time
	systemStat       *SystemStat
	metricsDiskPath  string
	opsSystemMetrics *OpsSystemMetrics
}

// NewOpsSystemMonitor is the constructor for OpsSystemMonitor
// also registers system metrics and runtime metrics
func NewOpsSystemMonitor(ctx context.Context, interval time.Duration, metricsDiskPath string) *OpsSystemMonitor {
	opsSystemMetrics := NewOpsSystemMetrics()
	opsSystemMetrics.RegisterMetrics()
	if metricsDiskPath == "" {
		metricsDiskPath = "/"
	}
	return &OpsSystemMonitor{
		ctx:              ctx,
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
	cpuStat, err := cpu.TimesWithContext(o.ctx, false)
	if err != nil {
		o.logger.Errorf("getting cpu time stats error: %v", err)
	}
	o.systemStat.CPUTime = &cpuStat[0]
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
	cpuGauge := o.opsSystemMetrics.CpuStats
	cpuStat := o.systemStat.CPUTime
	if cpuGauge != nil && cpuStat != nil {
		cpuGauge.WithLabelValues("total").Set(cpuStat.Total())
		cpuGauge.WithLabelValues("user").Set(cpuStat.User)
		cpuGauge.WithLabelValues("system").Set(cpuStat.System)
		cpuGauge.WithLabelValues("idle").Set(cpuStat.Idle)
		cpuGauge.WithLabelValues("nice").Set(cpuStat.Idle)
		cpuGauge.WithLabelValues("soft_irq").Set(cpuStat.Softirq)
		cpuGauge.WithLabelValues("irq").Set(cpuStat.Irq)
		cpuGauge.WithLabelValues("iowait").Set(cpuStat.Iowait)
		cpuGauge.WithLabelValues("steal").Set(cpuStat.Steal)
	}

	// Memory
	memGauge := o.opsSystemMetrics.MemoryStats
	memstat := o.systemStat.MemoryStats
	if memGauge != nil && memstat != nil {
		memGauge.WithLabelValues("total").Set(float64(memstat.Total))
		memGauge.WithLabelValues("free").Set(float64(memstat.Free))
		memGauge.WithLabelValues("used").Set(float64(memstat.Used))
		memGauge.WithLabelValues("used_percent").Set(float64(memstat.UsedPercent))
	}

	// Disk Usage
	diskGauge := o.opsSystemMetrics.DiskStats
	diskStat := o.systemStat.DiskStats
	if diskGauge != nil && diskStat != nil {
		diskGauge.WithLabelValues("total").Set(float64(diskStat.Total))
		diskGauge.WithLabelValues("used").Set(float64(diskStat.Used))
		diskGauge.WithLabelValues("free").Set(float64(diskStat.Free))
		diskGauge.WithLabelValues("used_percent").Set(float64(diskStat.UsedPercent))
	}

	// Network
	netGauge := o.opsSystemMetrics.NetworkStats
	for _, ns := range o.netStats {
		lastStat, ok := o.netStats[ns.Name]
		if ok && time.Since(o.netStatsUpdated[ns.Name]) <= 2*o.interval {
			netGauge.WithLabelValues("bytesSent", ns.Name).Add(float64(ns.BytesSent - lastStat.BytesSent))
			netGauge.WithLabelValues("bytesRecv", ns.Name).Add(float64(ns.BytesRecv - lastStat.BytesRecv))
			netGauge.WithLabelValues("packetsSent", ns.Name).Add(float64(ns.PacketsSent - lastStat.PacketsSent))
			netGauge.WithLabelValues("packetsRecv", ns.Name).Add(float64(ns.PacketsRecv - lastStat.PacketsRecv))
			netGauge.WithLabelValues("errin", ns.Name).Add(float64(ns.Errin - lastStat.Errin))
			netGauge.WithLabelValues("errout", ns.Name).Add(float64(ns.Errout - lastStat.Errout))
			netGauge.WithLabelValues("dropin", ns.Name).Add(float64(ns.Dropin - lastStat.Dropin))
			netGauge.WithLabelValues("dropout", ns.Name).Add(float64(ns.Dropout - lastStat.Dropout))
		}
		o.netStats[ns.Name] = ns
		o.netStatsUpdated[ns.Name] = time.Now()
	}
}
