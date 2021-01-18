package ops

import (
	"fmt"
	"github.com/VictoriaMetrics/metrics"
	"github.com/shirou/gopsutil/v3/cpu"
	"github.com/shirou/gopsutil/v3/disk"
	"github.com/shirou/gopsutil/v3/mem"
	"github.com/shirou/gopsutil/v3/net"
)

const (
	METRICS_MEMORY_EXPOSITION  = `ops_memory_stats{type="%s"}`
	METRICS_CPU_EXPOSITION     = `ops_cpu_stats{type="%s"}`
	METRICS_DISK_EXPOSITION    = `ops_disk_stats{type="%s"}`
	METRICS_NETWORK_EXPOSITION = `ops_network_stats{type="%s", iface="%s"}`
)

// OpsSystemMetrics contains the metricsetheus monitoring metrics
// for the whole application.
type OpsSystemMetrics struct {
	MemoryStats  *memoryMetrics
	CpuStats     *cpuMetrics
	DiskStats    *diskMetrics
	NetworkStats *networkMetrics
}

func getOrCreateGauge(format string, label string, value float64) *metrics.Gauge {
	return metrics.GetOrCreateGauge(fmt.Sprintf(format, label), func() float64 {
		return value
	})
}

func getOrCreateCounter(format string, label string, iface string, value float64) *metrics.Gauge {
	return metrics.GetOrCreateGauge(fmt.Sprintf(format, label, iface), func() float64 {
		return value
	})
}

type memoryMetrics struct{}

func (m *memoryMetrics) updatePrometheusStats(memStats *mem.VirtualMemoryStat) {
	getOrCreateGauge(METRICS_MEMORY_EXPOSITION, "total", float64(memStats.Total))
	getOrCreateGauge(METRICS_MEMORY_EXPOSITION, "free", float64(memStats.Free))
	getOrCreateGauge(METRICS_MEMORY_EXPOSITION, "used", float64(memStats.Used))
	getOrCreateGauge(METRICS_MEMORY_EXPOSITION, "used_percent", float64(memStats.UsedPercent))
}

type cpuMetrics struct{}

func (c *cpuMetrics) createGauge(label string, value float64) *metrics.Gauge {
	return getOrCreateGauge(METRICS_CPU_EXPOSITION, label, value)
}

func (c *cpuMetrics) updatePrometheusStats(cpuStats *cpu.TimesStat) {
	c.createGauge("total", cpuStats.Total())
	c.createGauge("user", cpuStats.User)
	c.createGauge("system", cpuStats.System)
	c.createGauge("idle", cpuStats.Idle)
	c.createGauge("nice", cpuStats.Nice)
	c.createGauge("soft_irq", cpuStats.Softirq)
	c.createGauge("irq", cpuStats.Irq)
	c.createGauge("iowait", cpuStats.Iowait)
	c.createGauge("steal", cpuStats.Steal)
}

type diskMetrics struct{}

func (d *diskMetrics) createGauge(label string, value float64) *metrics.Gauge {
	return getOrCreateGauge(METRICS_DISK_EXPOSITION, label, value)
}

func (d *diskMetrics) updatePrometheusStats(diskStats *disk.UsageStat) {
	d.createGauge("total", float64(diskStats.Total))
	d.createGauge("used", float64(diskStats.Used))
	d.createGauge("free", float64(diskStats.Free))
	d.createGauge("used_percent", float64(diskStats.UsedPercent))
}

type networkMetrics struct{}

func (n *networkMetrics) createCounter(label, iface string, value float64) *metrics.Gauge {
	return getOrCreateCounter(METRICS_NETWORK_EXPOSITION, label, iface, value)
}

func (n *networkMetrics) updatePrometheusStats(lastStat, ns net.IOCountersStat) {
	n.createCounter("bytesSent", ns.Name, float64(ns.BytesSent-lastStat.BytesSent))
	n.createCounter("bytesRecv", ns.Name, float64(ns.BytesRecv-lastStat.BytesRecv))
	n.createCounter("packetsSent", ns.Name, float64(ns.PacketsSent-lastStat.PacketsSent))
	n.createCounter("packetsRecv", ns.Name, float64(ns.PacketsRecv-lastStat.PacketsRecv))
	n.createCounter("errin", ns.Name, float64(ns.Errin-lastStat.Errin))
	n.createCounter("errout", ns.Name, float64(ns.Errout-lastStat.Errout))
	n.createCounter("dropin", ns.Name, float64(ns.Dropin-lastStat.Dropin))
	n.createCounter("dropout", ns.Name, float64(ns.Dropout-lastStat.Dropout))
}

func NewOpsSystemMetrics() *OpsSystemMetrics {
	return &OpsSystemMetrics{
		MemoryStats:  &memoryMetrics{},
		CpuStats:     &cpuMetrics{},
		DiskStats:    &diskMetrics{},
		NetworkStats: &networkMetrics{},
	}
}
