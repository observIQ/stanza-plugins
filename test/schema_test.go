package plugins

import (
	"context"
	"fmt"
	"io/ioutil"
	"os"
	"path/filepath"
	"strings"
	"testing"

	"github.com/go-git/go-git/v5"
	"github.com/stretchr/testify/require"
	"github.com/testcontainers/testcontainers-go"
)

func TestSchemas(t *testing.T) {
	path, err := os.Getwd()
	require.NoError(t, err)

	pluginsPath := fmt.Sprintf("%s/%s", path, "../temp/plugins")
	schemasPath := fmt.Sprintf("%s/%s", path, "../schemas")

	plugins := []string{}

	err = filepath.Walk(pluginsPath,
		func(path string, info os.FileInfo, err error) error {
			if err != nil {
				return err
			}
			if !info.IsDir() && strings.Contains(path, ".yaml") {
				plugins = append(plugins, path)
			}
			return nil
		})
	if err != nil {
		t.Logf("Failed to build list of config files: %s", err.Error())
		t.FailNow()
	}

	for _, plugin := range plugins {
		schema := plugin
		t.Run(plugin, func(t *testing.T) {
			err := schemaTest(
				pluginsPath,
				schemasPath,
				plugin,
				schema,
			)
			require.NoError(t, err)
		})
	}
}

func schemaTest(pluginDir, schemaDir, pluginFile, schemaFile string) error {
	tempDir, err := ioutil.TempDir("", "")
	if err != nil {
		return err
	}

	repoURI := "https://github.com/nrkno/yaml-schema-validator-github-action.git"
	_, err = git.PlainClone(tempDir, false, &git.CloneOptions{
		URL:      repoURI,
		Progress: os.Stdout,
	})
	if err != nil {
		return err
	}

	req := testcontainers.ContainerRequest{
		FromDockerfile: testcontainers.FromDockerfile{
			Context:    tempDir,
			Dockerfile: "Dockerfile",
		},
		Entrypoint: []string{"/bin/sleep", "9999"},
		Env: map[string]string{
			"INPUT_TARGET": fmt.Sprintf("%s/%s", "/plugins", pluginFile),
			"INPUT_SCHEMA": fmt.Sprintf("%s/%s", "/schemas", schemaFile),
		},
		BindMounts: map[string]string{
			pluginDir: "/plugins",
			schemaDir: "/schemas",
		},
	}
	if err := req.Validate(); err != nil {
		return err
	}

	schema, err := testcontainers.GenericContainer(context.Background(), testcontainers.GenericContainerRequest{
		ContainerRequest: req,
		Started:          true,
	})
	if err != nil {
		return err
	}

	code, err := schema.Exec(context.Background(), []string{"/entrypoint.sh"})
	if err != nil {
		return err
	}
	if code != 0 {
		return fmt.Errorf("expected 0, got %d", code)
	}
	return nil
}
