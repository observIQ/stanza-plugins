ALL_MODULES := $(shell find . -type f -name "go.mod" -exec dirname {} \; | sort )
PLUGINS := $(shell ls ./plugins)

.PHONY: test
test: sed-plugins
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

# sed-plugins will render plugins so they can be checked
# against their schema
.PHONY: sed-plugins
sed-plugins: temp/plugins
	scripts/sed.sh

temp/plugins:
	mkdir -p temp/plugins

.PHONY: minikube
minikube:
	minikube start
	dev/k8s/deploy.sh

.PHONY: minikube-exec
minikube-exec:
	dev/k8s/exec.sh