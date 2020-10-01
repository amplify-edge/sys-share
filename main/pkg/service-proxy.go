package pkg

import "fmt"


// Invoke ...
func Invoke() string {
	// load up the sub grpc Services proxy

	fmt.Println("sys-share GRPC Services Proxy")

	return "hello from sys-share GRPC Services Proxy"
}
