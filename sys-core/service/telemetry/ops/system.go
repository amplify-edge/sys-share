package ops

import prom "github.com/prometheus/client_golang/prometheus"

// OpsSystemMetrics contains the prometheus monitoring metrics
// for the whole application.
type OpsSystemMetrics struct {
	MemoryStats  *prom.GaugeVec
	CpuStats     *prom.GaugeVec
	DiskStats    *prom.GaugeVec
	NetworkStats *prom.CounterVec
}

func NewOpsSystemMetrics() *OpsSystemMetrics {
	return &OpsSystemMetrics{
		MemoryStats: prom.NewGaugeVec(prom.GaugeOpts{
			Name: "ops_mem_stats",
			Help: "system memory usage stats, use for Ops",
		}, []string{}),
		CpuStats: prom.NewGaugeVec(prom.GaugeOpts{
			Name: "ops_cpu_stats",
			Help: "system cpu time stats, use for Ops",
		}, []string{}),
		DiskStats: prom.NewGaugeVec(prom.GaugeOpts{
			Name: "ops_disk_usage_stats",
			Help: "system disk usage stats, use for Ops",
		}, []string{}),
		NetworkStats: prom.NewCounterVec(prom.CounterOpts{
			Name: "ops_network_stats",
			Help: "system network stats, use for Ops, labelled by network interface",
		}, []string{"net_iface"}),
	}
}

func (o *OpsSystemMetrics) RegisterMetrics() {
	prom.MustRegister(o.CpuStats, o.DiskStats, o.MemoryStats, o.NetworkStats)
}
