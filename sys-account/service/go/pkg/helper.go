package pkg

import (
	"google.golang.org/protobuf/types/known/timestamppb"
	"time"
)

// helper func to convert unix timestamp (seconds) to timestamppb.Timestamp
func UnixToUtcTS(in int64) *timestamppb.Timestamp {
	t := time.Unix(0, in).UTC()
	return timestamppb.New(t)
}

func TsToUnixUTC(in *timestamppb.Timestamp) int64 {
	return int64(in.GetNanos())
}
