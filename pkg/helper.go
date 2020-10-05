package pkg

import (
	"google.golang.org/protobuf/types/known/timestamppb"
	"time"
)

// helper func to convert unix timestamp (seconds) to timestamppb.Timestamp
func unixToUtcTS(in int64) *timestamppb.Timestamp {
	t := time.Unix(in, 0).UTC()
	return timestamppb.New(t)
}

func tsToUnixUTC(in *timestamppb.Timestamp) int64 {
	return in.GetSeconds()
}
