package bus

import (
	"context"

	"github.com/segmentio/encoding/json"

	"github.com/getcouragenow/sys-share/sys-core/service/go/pkg"
)

type ActionDispatcher func(context.Context, *pkg.EventRequest) (map[string]interface{}, error)

type CoreBus struct {
	actions map[string]ActionDispatcher
}

func NewCoreBus() *CoreBus {
	return &CoreBus{}
}

func (c *CoreBus) RegisterAction(name string, in ActionDispatcher) {
	c.actions[name] = in
}

func (c *CoreBus) Broadcast(ctx context.Context, in *pkg.EventRequest) (*pkg.EventResponse, error) {
	if c.actions == nil {
		return nil, Error{
			Reason: errEmptyAction,
		}
	}
	if c.actions[in.EventName] == nil {
		return nil, Error{
			Reason: errUnknownEvent,
		}
	}
	resp, err := c.actions[in.EventName](ctx, in)
	if err != nil {
		return nil, err
	}
	respByte, err := json.Marshal(resp)
	if err != nil {
		return nil, err
	}
	return &pkg.EventResponse{Reply: respByte}, nil
}
