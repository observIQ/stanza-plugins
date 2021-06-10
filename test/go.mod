module github.com/observiq/stanza-plugins

go 1.16

require (
	github.com/Azure/azure-sdk-for-go v45.1.0+incompatible // indirect
	github.com/Azure/go-autorest/autorest v0.11.4 // indirect
	github.com/go-git/go-git/v5 v5.4.1
	github.com/observiq/stanza v0.14.2
	github.com/observiq/stanza/operator/builtin/input/k8sevent v0.1.2
	github.com/observiq/stanza/operator/builtin/input/windows v0.1.3
	github.com/observiq/stanza/operator/builtin/output/elastic v0.1.2
	github.com/observiq/stanza/operator/builtin/output/googlecloud v0.1.3
	github.com/observiq/stanza/operator/builtin/output/newrelic v0.1.2
	github.com/observiq/stanza/operator/builtin/parser/syslog v0.1.5
	github.com/observiq/stanza/operator/builtin/transformer/k8smetadata v0.1.2
	github.com/stretchr/testify v1.7.0
	github.com/testcontainers/testcontainers-go v0.10.0
	go.uber.org/zap v1.17.0
)
