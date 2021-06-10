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
	valid, invalid, err := detectConfigs()
	if err != nil {
		t.Error(err)
		return
	}

	for _, config := range valid {
		t.Run(config, func(t *testing.T) {
			_, err := newAgent(config, pluginDir)
			require.NoError(t, err)
		})
	}

	for _, config := range invalid {
		t.Run(config, func(t *testing.T) {
			_, err := newAgent(config, pluginDir)
			require.Error(t, err)
		})
	}
}

func newAgent(configPath, pluginDir string) (*agent.LogAgent, error) {
	l, err := newDefaultLoggerAt()
	if err != nil {
		return nil, err
	}
	return agent.NewBuilder(l).
		WithConfigFiles([]string{configPath}).
		WithPluginDir(pluginDir).
		Build()
}

func newDefaultLoggerAt() (*zap.SugaredLogger, error) {
	baseLogger, err := zap.NewProductionConfig().Build()
	if err != nil {
		return nil, err
	}
	return baseLogger.Sugar(), nil
}

func detectConfigs() (valid, invalid []string, err error) {
	err = filepath.Walk(configBaseDir,
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
	return valid, invalid, err
}
