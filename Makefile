ALL_MODULES := $(shell find . -type f -name "go.mod" -exec dirname {} \; | sort )
PLUGINS := $(shell ls ./plugins)

.PHONY: test
test:
	bash scripts/test_certificate.sh
	$(MAKE) for-all CMD="go clean -testcache ./..." 
	$(MAKE) for-all CMD="go test ./..."

.PHONY: tidy
tidy:
	$(MAKE) for-all CMD="rm -fr go.sum"
	$(MAKE) for-all CMD="go mod tidy"

.PHONY: for-all
for-all:
	@set -e; for dir in $(ALL_MODULES); do \
	  (cd "$${dir}" && $${CMD} ); \
	done

.PHONY: minikube
minikube:
	minikube start
	dev/k8s/deploy.sh

.PHONY: minikube-exec
minikube-exec:
	dev/k8s/exec.sh

.PHONY: minikube-logs
minikube-logs:
	@dev/k8s/logs.sh