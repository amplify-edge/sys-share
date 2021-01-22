package logging

import "google.golang.org/grpc"

// Logger c
type Logger interface {
	InitLogger(extraFields map[string]string)
	WithFields(extraFields map[string]string) Logger // WithFields create sub-logger / technically new logger
	Debug(args ...interface{})
	Debugf(template string, args ...interface{})
	Info(args ...interface{})
	Infof(template string, args ...interface{})
	Warn(args ...interface{})
	Warnf(template string, args ...interface{})
	Error(args ...interface{})
	Errorf(template string, args ...interface{})
	Panic(args ...interface{})
	Panicf(template string, args ...interface{})
	Fatal(args ...interface{})
	Fatalf(template string, args ...interface{})
	GetServerUnaryInterceptor() grpc.UnaryServerInterceptor
	GetServerStreamInterceptor() grpc.StreamServerInterceptor
}
