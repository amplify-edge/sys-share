package bus

import (
	"context"
	dbrpc "go.amplifyedge.org/sys-share-v2/sys-core/service/go/rpc/v2"

	"github.com/segmentio/encoding/json"
)

type ActionDispatcher func(context.Context, *dbrpc.EventRequest) (map[string]interface{}, error)

type CoreBus struct {
	actions map[string]ActionDispatcher
}

func NewCoreBus() *CoreBus {
	return &CoreBus{actions: map[string]ActionDispatcher{}}
}

func (c *CoreBus) RegisterAction(name string, in ActionDispatcher) {
	c.actions[name] = in
}

func (c *CoreBus) Broadcast(ctx context.Context, in *dbrpc.EventRequest) (*dbrpc.EventResponse, error) {
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
	return &dbrpc.EventResponse{Reply: respByte}, nil
}
