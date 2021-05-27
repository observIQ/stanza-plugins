module github.com/observiq/stanza-plugins

go 1.16

require (
	github.com/Azure/azure-sdk-for-go v45.1.0+incompatible // indirect
	github.com/Azure/go-autorest/autorest v0.11.4 // indirect
	github.com/Azure/go-autorest/autorest/adal v0.9.2 // indirect
	github.com/observiq/stanza v0.14.2
	github.com/observiq/stanza/operator/builtin/input/k8sevent v0.1.2
	github.com/observiq/stanza/operator/builtin/input/windows v0.1.3
	github.com/observiq/stanza/operator/builtin/output/elastic v0.1.2
	github.com/observiq/stanza/operator/builtin/output/googlecloud v0.1.3
	github.com/observiq/stanza/operator/builtin/output/newrelic v0.1.2
	github.com/observiq/stanza/operator/builtin/parser/syslog v0.1.5
	github.com/observiq/stanza/operator/builtin/transformer/k8smetadata v0.1.2
	github.com/sirupsen/logrus v1.6.0 // indirect
	github.com/stretchr/objx v0.2.0 // indirect
	github.com/stretchr/testify v1.7.0
	go.uber.org/zap v1.17.0
	golang.org/x/time v0.0.0-20200630173020-3af7569d3a1e // indirect
	google.golang.org/grpc v1.32.0 // indirect
)
