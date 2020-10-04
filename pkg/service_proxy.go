package pkg

import (
	log "github.com/sirupsen/logrus"
)

type SysShareProxyService struct {
	SysAccount *SysAccountService
}

type SysShareProxyClient struct {
	SysAccountClient *SysAccountClient
}

// Invoke invokes client side GRPC calls to running server.
func Invoke() string {
	// TODO:load up the sub grpc Services proxy
	log.Println("In sys-share GRPC Services Proxy")
	return "hello from sys-share GRPC Services Proxy"
}
