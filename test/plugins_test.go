package plugins

import (
	"testing"

	agent "github.com/observiq/stanza/agent"
	"github.com/stretchr/testify/require"
	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
)

func TestValidConfigs(t *testing.T) {
	_, err := newAgent("./configs/nginx/valid/minimal_from_file.yaml", "../plugins")
	require.NoError(t, err)
}

func TestInvalidConfigs(t *testing.T) {
	_, err := newAgent("./configs/nginx/invalid/missing_required_pod_name.yaml", "../plugins")
	require.Error(t, err)
}

func newAgent(configPath, pluginDir string) (*agent.LogAgent, error) {
	return agent.NewBuilder(newDefaultLoggerAt()).
		WithConfigFiles([]string{configPath}).
		WithPluginDir(pluginDir).
		Build()
}

// based on from github.com/observiq/stanza/cmd/stanza/logging.go
func newDefaultLoggerAt() *zap.SugaredLogger {
	logCfg := zap.NewProductionConfig()
	logCfg.Level = zap.NewAtomicLevelAt(zapcore.DebugLevel)
	logCfg.Sampling = nil
	logCfg.EncoderConfig.CallerKey = ""
	logCfg.EncoderConfig.StacktraceKey = ""
	logCfg.EncoderConfig.TimeKey = "timestamp"
	logCfg.EncoderConfig.MessageKey = "message"
	logCfg.EncoderConfig.EncodeTime = zapcore.ISO8601TimeEncoder

	baseLogger, err := logCfg.Build()
	if err != nil {
		panic(err)
	}
	return baseLogger.Sugar()
}
