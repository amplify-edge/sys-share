package zaplog

import (
	"github.com/getcouragenow/sys-share/sys-core/service/logging"
	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
	"google.golang.org/grpc"
	"os"

	grpcZap "github.com/grpc-ecosystem/go-grpc-middleware/logging/zap"
)

// ZapLogger implements Logger interface as defined in
// "github.com/getcouragenow/sys-share/sys-core/service/logging"
type ZapLogger struct {
	isDevelopmentMode bool
	logLevel          string
	moduleName        string
	sugarLogger       *zap.SugaredLogger
}

// Zap Logger constructor
func NewZapLogger(level, moduleName string, isDevelopmentMode bool) *ZapLogger {
	return &ZapLogger{logLevel: level, isDevelopmentMode: isDevelopmentMode, moduleName: moduleName}
}

// For mapping config logger to app logger levels
var loggerLevelMap = map[string]zapcore.Level{
	"debug":  zapcore.DebugLevel,
	"info":   zapcore.InfoLevel,
	"warn":   zapcore.WarnLevel,
	"error":  zapcore.ErrorLevel,
	"dpanic": zapcore.DPanicLevel,
	"panic":  zapcore.PanicLevel,
	"fatal":  zapcore.FatalLevel,
}

func (l *ZapLogger) configuredLogLevel() zapcore.Level {
	level, exist := loggerLevelMap[l.logLevel]
	if !exist {
		return zapcore.DebugLevel
	}

	return level
}

// Init logger
func (l *ZapLogger) InitLogger(extraFields map[string]string) {
	logLevel := l.configuredLogLevel()

	logWriter := zapcore.AddSync(os.Stderr)

	var encoderCfg zapcore.EncoderConfig
	if l.isDevelopmentMode {
		encoderCfg = zap.NewDevelopmentEncoderConfig()
	} else {
		encoderCfg = zap.NewProductionEncoderConfig()
	}

	var encoder zapcore.Encoder
	encoderCfg.LevelKey = "LVL"
	encoderCfg.CallerKey = "CALLER"
	encoderCfg.TimeKey = "TIME"
	encoderCfg.NameKey = "NAME"
	encoderCfg.MessageKey = "MSG"

	if l.isDevelopmentMode {
		encoder = zapcore.NewConsoleEncoder(encoderCfg)
	} else {
		encoder = zapcore.NewJSONEncoder(encoderCfg)
	}

	zapFields := []zap.Field{}
	zapFields = append(zapFields, zap.Any("app", l.moduleName))
	if extraFields != nil {
		for k, v := range extraFields {
			zapFields = append(zapFields, zap.Any(k, v))
		}
	}

	encoderCfg.EncodeTime = zapcore.ISO8601TimeEncoder
	core := zapcore.NewCore(encoder, logWriter, zap.NewAtomicLevelAt(logLevel)).With(zapFields)
	logger := zap.New(core, zap.AddCaller(), zap.AddCallerSkip(1))

	l.sugarLogger = logger.Sugar()
	//if err := l.sugarLogger.Sync(); err != nil {
	//	l.sugarLogger.Error(err)
	//}
	l.sugarLogger.Sync()
}

// ZapLogger methods to satisfy Logger interface
func (l *ZapLogger) WithFields(extraFields map[string]string) logging.Logger {
	zl := l
	zl.InitLogger(extraFields)
	return zl
}

func (l *ZapLogger) Debug(args ...interface{}) {
	l.sugarLogger.Debug(args...)
}

func (l *ZapLogger) Debugf(template string, args ...interface{}) {
	l.sugarLogger.Debugf(template, args...)
}

func (l *ZapLogger) Info(args ...interface{}) {
	l.sugarLogger.Info(args...)
}

func (l *ZapLogger) Infof(template string, args ...interface{}) {
	l.sugarLogger.Infof(template, args...)
}

func (l *ZapLogger) Warn(args ...interface{}) {
	l.sugarLogger.Warn(args...)
}

func (l *ZapLogger) Warnf(template string, args ...interface{}) {
	l.sugarLogger.Warnf(template, args...)
}

func (l *ZapLogger) Error(args ...interface{}) {
	l.sugarLogger.Error(args...)
}

func (l *ZapLogger) Errorf(template string, args ...interface{}) {
	l.sugarLogger.Errorf(template, args...)
}

func (l *ZapLogger) Panic(args ...interface{}) {
	l.sugarLogger.Panic(args...)
}

func (l *ZapLogger) Panicf(template string, args ...interface{}) {
	l.sugarLogger.Panicf(template, args...)
}

func (l *ZapLogger) Fatal(args ...interface{}) {
	l.sugarLogger.Fatal(args...)
}

func (l *ZapLogger) Fatalf(template string, args ...interface{}) {
	l.sugarLogger.Fatalf(template, args...)
}

func (l *ZapLogger) GetServerUnaryInterceptor() grpc.UnaryServerInterceptor {
	zapOpts := []grpcZap.Option{
		grpcZap.WithLevels(grpcZap.DefaultCodeToLevel),
	}
	return grpcZap.UnaryServerInterceptor(l.sugarLogger.Desugar(), zapOpts...)
}

func (l *ZapLogger) GetServerStreamInterceptor() grpc.StreamServerInterceptor {
	zapOpts := []grpcZap.Option{
		grpcZap.WithLevels(grpcZap.DefaultCodeToLevel),
	}
	return grpcZap.StreamServerInterceptor(l.sugarLogger.Desugar(), zapOpts...)
}
