package tracing

import (
	"io"

	"github.com/opentracing/opentracing-go"
	"github.com/uber/jaeger-client-go"
	jaegercfg "github.com/uber/jaeger-client-go/config"
	jaegerlog "github.com/uber/jaeger-client-go/log"
)

// const (
// 	defaultLogSpanEnabled = true
// )

type TracingConfig struct {
	AgentHost string
	ModuleName string // in the single binary case it's the name of the application
}

func NewTracerConfig(agentHost string, moduleName string) *TracingConfig {
	return &TracingConfig{
		AgentHost: agentHost,
		ModuleName: moduleName,
	}
}

// NewTracer creates a new opentracking tracer
func NewTracer(cfg *TracingConfig) (opentracing.Tracer, io.Closer, error) {
	jaegerCfgInstance := jaegercfg.Configuration{
		ServiceName: cfg.ModuleName,
		Sampler: &jaegercfg.SamplerConfig{
			Type:  jaeger.SamplerTypeConst,
			Param: 1,
		},
		Reporter: &jaegercfg.ReporterConfig{
			LogSpans:           true,
			LocalAgentHostPort: cfg.AgentHost,
		},
	}

	return jaegerCfgInstance.NewTracer(
		jaegercfg.Logger(jaegerlog.StdLogger),
	)
}