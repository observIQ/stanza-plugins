ALL_MODULES := $(shell find . -type f -name "go.mod" -exec dirname {} \; | sort )

.PHONY: test
test:
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
