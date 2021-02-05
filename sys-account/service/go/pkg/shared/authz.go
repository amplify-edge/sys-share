package shared

import (
	"context"
	"go.amplifyedge.org/sys-share-v2/sys-core/service/logging"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type ServerAuthzInterceptor interface {
	GetUnauthenticatedRoutes() []string
	GetAuthenticatedRoutes() map[string]func(claims TokenClaims) error // for bus
	GetTokenConfig() *TokenConfig
	GetLogger() logging.Logger
}

func ClaimsFromMetadata(ctx context.Context, isAccess bool, itc ServerAuthzInterceptor) (claims TokenClaims, err error) {
	var authmeta string
	if authmeta, err = FromMetadata(ctx); err != nil {
		return TokenClaims{}, err
	}

	if claims, err = itc.GetTokenConfig().ParseTokenStringToClaim(authmeta, isAccess); err != nil {
		return TokenClaims{}, err
	}
	return claims, nil
}

func ServerInterceptor(itc ServerAuthzInterceptor) func(context.Context) (context.Context, error) {
	return func(ctx context.Context) (context.Context, error) {
		methodName, ok := grpc.Method(ctx)
		if ok {
			itc.GetLogger().Infof("Method being called: %s", methodName)
		}
		for _, unauthedRoute := range itc.GetUnauthenticatedRoutes() {
			if unauthedRoute == methodName {
				return ctx, nil
			}
		}
		claims, err := ClaimsFromMetadata(ctx, true, itc)
		if err != nil {
			return nil, status.Errorf(codes.Unauthenticated, "Request unauthenticated with error: %v", err)
		}

		authFunc := itc.GetAuthenticatedRoutes()[methodName]
		if authFunc != nil {
			if err = authFunc(claims); err != nil {
				return ctx, err
			}
		}

		return context.WithValue(ctx, ContextKeyClaims, claims), nil
	}
}
