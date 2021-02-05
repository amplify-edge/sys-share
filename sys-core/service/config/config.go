package config

import (
	"crypto/rand"
	"encoding/base64"
	"math/big"
	"time"

	"github.com/segmentio/encoding/json"
	"github.com/segmentio/ksuid"
	"google.golang.org/protobuf/types/known/timestamppb"
	"gopkg.in/yaml.v2"
)

// TODO @gutterbacon: use this as abstraction for per module configs.
type Configurator interface {
	Validate() error
}

func GenRandomByteSlice(length int) ([]byte, error) {
	const legalChars = "01234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-_"
	rnd := make([]byte, length)
	for i := 0; i < length; i++ {
		num, err := rand.Int(rand.Reader, big.NewInt(int64(len(legalChars))))
		if err != nil {
			return nil, err
		}
		rnd = append(rnd, legalChars[num.Int64()])
	}
	return rnd, nil
}

func NewID() string {
	return ksuid.New().String()
}

// helper func to convert unix timestamp (seconds) to timestamppb.Timestamp
func UnixToUtcTS(in int64) *timestamppb.Timestamp {
	t := time.Unix(0, in).UTC()
	return timestamppb.New(t)
}

func CurrentTimestamp() int64 {
	return time.Now().UTC().UnixNano()
}

func MarshalPretty(any interface{}) ([]byte, error) {
	return json.MarshalIndent(&any, "", "  ")
}

func MarshalYAML(any interface{}) ([]byte, error) {
	return yaml.Marshal(&any)
}

func UnmarshalJson(data []byte, any interface{}) error {
	return json.Unmarshal(data, any)
}

func UnmarshalYAML(data []byte, any interface{}) error {
	return yaml.UnmarshalStrict(data, any)
}

func TsToUnixUTC(in *timestamppb.Timestamp) int64 {
	return int64(in.GetNanos())
}

func DecodeB64(in string) ([]byte, error) {
	return base64.RawStdEncoding.DecodeString(in)
}

func DedupSlice(stringSlice []string) []string {
	keys := make(map[string]bool)
	list := []string{}
	for _, entry := range stringSlice {
		if _, value := keys[entry]; !value {
			keys[entry] = true
			list = append(list, entry)
		}
	}
	return list
}

