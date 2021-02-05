// package interceptor creates interceptor for inter-service communication
// for example mod-disco is a client to sys-account
package interceptor

import (
	"context"
	"google.golang.org/grpc/metadata"
	"time"

	"go.amplifyedge.org/sys-share-v2/sys-core/service/logging"
	"google.golang.org/grpc"

	"go.amplifyedge.org/sys-share-v2/sys-account/service/go/pkg"
	sharedAuth "go.amplifyedge.org/sys-share-v2/sys-account/service/go/pkg/shared"
)

const (
	DEFAULT_REFRESH_DURATION = 15 * time.Minute
)

type ClientSide struct {
	authClient      pkg.AuthServiceClient
	accessToken     string
	refreshToken    string
	routesToAttach  []string
	refreshDuration time.Duration
	logger          logging.Logger
}

func NewClientSideInterceptor(client pkg.AuthServiceClient, access, refresh string, routesToAttach []string, logger logging.Logger) (*ClientSide, error) {
	c := &ClientSide{
		authClient:      client,
		accessToken:     access,
		refreshToken:    refresh,
		refreshDuration: DEFAULT_REFRESH_DURATION,
		logger:          logger.WithFields(map[string]interface{}{"purpose": "clientInterceptor"}),
	}
	c.scheduleRefreshToken()
	return c, nil
}

// Unary => returns grpc.UnaryClientInterceptor
func (c *ClientSide) Unary() grpc.UnaryClientInterceptor {
	return func(ctx context.Context, method string, req, reply interface{}, cc *grpc.ClientConn, invoker grpc.UnaryInvoker, opts ...grpc.CallOption) error {
		c.logger.Debugf("auth unary interceptor: %v", method)

		for _, r := range c.routesToAttach {
			if method == r {
				return invoker(c.attachTokenToContext(ctx), method, req, reply, cc, opts...)
			}
		}

		return invoker(ctx, method, req, reply, cc, opts...)
	}
}

// Stream => returns grpc.StreamClientInterceptor
func (c *ClientSide) Stream() grpc.StreamClientInterceptor {
	return func(ctx context.Context, desc *grpc.StreamDesc, cc *grpc.ClientConn, method string, streamer grpc.Streamer, opts ...grpc.CallOption) (grpc.ClientStream, error) {
		c.logger.Debugf("auth stream interceptor: %v", method)
		for _, r := range c.routesToAttach {
			if method == r {
				return streamer(c.attachTokenToContext(ctx), desc, cc, method, opts...)
			}
		}
		return streamer(ctx, desc, cc, method, opts...)
	}
}

func (c *ClientSide) attachTokenToContext(ctx context.Context) context.Context {
	return metadata.AppendToOutgoingContext(ctx, sharedAuth.HeaderAuthorize, c.accessToken)
}

func (c *ClientSide) scheduleRefreshToken() {
	go func() {
		wait := c.refreshDuration
		for {
			time.Sleep(wait)
			ctx, _ := context.WithTimeout(context.Background(), 5*time.Second)
			err := c.getRefreshToken(ctx)
			if err != nil {
				c.logger.Errorf("Error getting refresh token: %v", err.Error())
			}
		}
	}()
}

func (c *ClientSide) getRefreshToken(ctx context.Context) error {
	resp, err := c.authClient.RefreshAccessToken(ctx, &pkg.RefreshAccessTokenRequest{RefreshToken: c.refreshToken})
	if err != nil {
		return err
	}
	c.accessToken = resp.AccessToken
	return nil
}
