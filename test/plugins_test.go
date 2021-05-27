package plugins

import (
	"os"
	"path/filepath"
	"strings"
	"testing"

	agent "github.com/observiq/stanza/agent"
	"github.com/stretchr/testify/require"
	"go.uber.org/zap"
)

const pluginDir = "../plugins"
const configBaseDir = "./configs"

func TestConfigs(t *testing.T) {
	valid, invalid := detectConfigs(t)

	for _, config := range valid {
		t.Run(config, func(t *testing.T) {
			_, err := newAgent(t, config, pluginDir)
			require.NoError(t, err)
		})
	}

	for _, config := range invalid {
		t.Run(config, func(t *testing.T) {
			_, err := newAgent(t, config, pluginDir)
			require.Error(t, err)
		})
	}
}

func newAgent(t *testing.T, configPath, pluginDir string) (*agent.LogAgent, error) {
	return agent.NewBuilder(newDefaultLoggerAt(t)).
		WithConfigFiles([]string{configPath}).
		WithPluginDir(pluginDir).
		Build()
}

func newDefaultLoggerAt(t *testing.T) *zap.SugaredLogger {
	baseLogger, err := zap.NewProductionConfig().Build()
	if err != nil {
		t.Logf("Zap logger error: %s", err.Error())
		t.FailNow()
	}
	return baseLogger.Sugar()
}

func detectConfigs(t *testing.T) (valid, invalid []string) {
	err := filepath.Walk(configBaseDir,
		func(path string, info os.FileInfo, err error) error {
			if err != nil {
				return err
			}

			if !info.IsDir() && strings.Contains(path, ".yaml") {
				if strings.Contains(path, "invalid") {
					invalid = append(invalid, path)
				} else {
					valid = append(valid, path)
				}
			}
			return nil
		})
	if err != nil {
		t.Logf("Failed to build list of config files: %s", err.Error())
		t.FailNow()
	}
	return valid, invalid
}
