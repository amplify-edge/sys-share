package zaplog

import (
	"errors"
	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
	"google.golang.org/grpc"
	"gopkg.in/natefinch/lumberjack.v2"
	"os"
	"path/filepath"

	"github.com/amplify-cms/sys-share/sys-core/service/logging"

	grpcZap "github.com/grpc-ecosystem/go-grpc-middleware/logging/zap"
)

const (
	DEBUG            = zapcore.DebugLevel
	INFO             = zapcore.InfoLevel
	WARN             = zapcore.WarnLevel
	ErrNoStoragePath = "error: logger is configured without a storage path"
)

// ZapLogger implements Logger interface as defined in
// "github.com/amplify-cms/sys-share/sys-core/service/logging"
type ZapLogger struct {
	isDevelopmentMode bool
	storagePath       string
	logLevel          zapcore.Level
	moduleName        string
	sugarLogger       *zap.SugaredLogger
}

// Zap Logger constructor
func NewZapLogger(level zapcore.Level, moduleName string, isDevelopmentMode bool, storagePath string) *ZapLogger {
	if !isDevelopmentMode && storagePath == "" {
		dir, _ := os.Getwd()
		storagePath = filepath.Join(dir, "gcn.log")
	}
	if !isDevelopmentMode && storagePath != "" {
		dir := filepath.Dir(storagePath)
		_ = os.MkdirAll(dir, os.ModeDir)
	}
	return &ZapLogger{logLevel: level, isDevelopmentMode: isDevelopmentMode, moduleName: moduleName, storagePath: storagePath}
}

func (l *ZapLogger) GetLogPath() (string, error) {
	if !l.isDevelopmentMode {
		return l.storagePath, nil
	}
	return "", errors.New("")
}

// Init logger
func (l *ZapLogger) InitLogger(extraFields map[string]interface{}) {
	// set log level
	logLevel := l.logLevel
	var logWriter zapcore.WriteSyncer
	var encoderCfg zapcore.EncoderConfig
	if l.isDevelopmentMode {
		logWriter = zapcore.AddSync(os.Stderr)
		encoderCfg = zap.NewDevelopmentEncoderConfig()
	} else {
		// for i.e. Loki store the logs to a file with log rotation, plus backup, plus safe concurrent writes.
		// use promtail to fed it to Loki.
		// even if we don't use loki, we can still ask the client / user / org to give their log file
		logWriter = zapcore.AddSync(&lumberjack.Logger{
			Filename:   l.storagePath,
			MaxSize:    200, // MB
			MaxBackups: 2,   // number of backups to keep
			MaxAge:     28,  // days
		})
		encoderCfg = zap.NewProductionEncoderConfig()
	}

	var encoder zapcore.Encoder
	encoderCfg.LevelKey = "lvl"
	encoderCfg.CallerKey = "caller"
	encoderCfg.TimeKey = "time"
	encoderCfg.NameKey = "name"
	encoderCfg.MessageKey = "msg"

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
	if err := l.sugarLogger.Sync(); err != nil {
		l.sugarLogger.Error(err)
	}
}

// ZapLogger methods to satisfy Logger interface
func (l *ZapLogger) WithFields(args map[string]interface{}) logging.Logger {
	zl := l
	zl.InitLogger(args)
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
