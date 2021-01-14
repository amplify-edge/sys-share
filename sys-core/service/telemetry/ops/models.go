package ops

import (
	"github.com/shirou/gopsutil/v3/cpu"
	"github.com/shirou/gopsutil/v3/disk"
	"github.com/shirou/gopsutil/v3/mem"
)

// SystemStat represents the status for one node of the system
// it contains cpu time, memory stats, and disk usage stats
type SystemStat struct {
	CPUTime     *cpu.TimesStat         `json:"cpu_time_stats"`
	MemoryStats *mem.VirtualMemoryStat `json:"memory_stats"`
	DiskStats   *disk.UsageStat        `json:"disk_stats"`
}

// TODO v3: monitor also the health of each node, or even more so
// the health of each module
