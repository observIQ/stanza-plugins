package plugins

import (
	"context"
	"fmt"
	"io/ioutil"
	"os"
	"path/filepath"
	"strings"
	"sync"
	"testing"

	"github.com/go-git/go-git/v5"
	"github.com/stretchr/testify/require"
	"github.com/testcontainers/testcontainers-go"
)

// 16 core system observed no more than 7 concurrent containers, this
// value is primarily to ensure that we do not spawn 50+ containers at once.
var maxConcurrentContainers = 10

type schemaTestCase struct {
	plugin      string
	schema      string
	pluginsPath string
	schemasPath string
}

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
				// append info.Name() because we only want file names, not full path
				plugins = append(plugins, info.Name())
			}
			return nil
		})
	if err != nil {
		t.Logf("Failed to build list of config files: %s", err.Error())
		t.FailNow()
	}

	// Spawn limited number of goroutines to avoid too many containers
	wg := sync.WaitGroup{}
	gaurd := make(chan struct{}, maxConcurrentContainers)
	for _, plugin := range plugins {
		tc := schemaTestCase{
			plugin:      plugin,
			schema:      plugin, // schema name is the same as plugin name
			pluginsPath: pluginsPath,
			schemasPath: schemasPath,
		}

		wg.Add(1)
		gaurd <- struct{}{}
		go tc.test(t, &wg, gaurd)
	}
	wg.Wait()
}

func (tc schemaTestCase) test(t *testing.T, wg *sync.WaitGroup, gaurd chan struct{}) {
	t.Run(tc.plugin, func(t *testing.T) {
		err := schemaTest(
			tc.pluginsPath,
			tc.schemasPath,
			tc.plugin,
			tc.schema,
		)
		require.NoError(t, err, fmt.Sprintf("plugin: %s", tc.plugin))
	})
	wg.Done()
	<-gaurd
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
		Name:       pluginFile,
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

	return schema.Terminate(context.Background())
}
