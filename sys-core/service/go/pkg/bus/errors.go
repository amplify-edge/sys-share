package bus

import (
	"fmt"
	"strings"
)

const (
	moduleName = "sys-core-bus: "
)

type ErrorReason int

const (
	errEmptyAction = iota
	errUnknownEvent
	ErrInvalidEventPayload
)

type Error struct {
	Reason ErrorReason
	Err    error
}

func (err Error) Error() string {
	if err.Err != nil {
		return fmt.Sprintf("%s (%v)", err.description(), err.Err)
	}
	return err.description()
}

func (err Error) description(extraValues ...string) string {
	var sb strings.Builder
	sb.WriteString(moduleName)
	sb.WriteString(err.desc())
	for _, s := range extraValues {
		sb.WriteString(s)
	}
	return sb.String()
}

func (err Error) desc() string {
	switch err.Reason {
	case errEmptyAction:
		return "bus has no dispatch action"
	case errUnknownEvent:
		return "error, bus received unknown event"
	case ErrInvalidEventPayload:
		return "error, bus received invalid event payload"
	default:
		return "unknown error occurred"
	}
}
