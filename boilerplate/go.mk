# go utils

# variables
# Path to operate on
GO_FSPATH == ???

# Path to build binary to.
GO_BUILD_OUT_FSPATH = ???

# Packages to operate on
GO_PKG_LIST = ???

# Array of external Golang Dependencies
GO_EXT_DEPS = ???

# Platforms / OS that is supported
GO_SUPPORTED_PLATFORMS=darwin windows linux

# Supported Architectures
GO_SUPPORTED_ARCHS=386 amd64 arm arm64

# Go cross-compile all output directory
GO_BUILD_OUT_ALL_FSPATH = ???

# Go binary name (already defined in boilerplate/core/tool.mk)
GO_BIN_NAME = ???

# Install external dependencies function
define GO_INSTALL_DEPS_FUNC
	$(if $(findstring "protoc-gen-validate",$(1)), \
		$(shell GO111MODULE=off go get -u -v $(1)), \
		$(shell GO111MODULE=off go get -d $(1) && GO111MODULE=off go get -u -v $(1)))
endef

# Uninstall external dependencies function
define GO_UNINSTALL_DEPS_FUNC
	$(shell export GO111MODULE=off; go clean -i $(DEPS))
endef

define BUILD_BIN_FUNC
	$(foreach GOARCH, $(2),$(shell export GOOS=$(1); export GOARCH=$(GOARCH); \
		go build -v -o $(GO_BUILD_OUT_ALL_FSPATH)/$(GO_BIN_NAME)-$(GOOS)-$(GOARCH) $(GO_FSPATH)))
endef

# Build for all supported platforms and architectures
define GO_BUILD_ALL_FUNC
	$(if $(findstring linux,$(1)),$(call BUILD_BIN_FUNC,$(1),$(GO_SUPPORTED_ARCHS)), \
		$(call BUILD_BIN_FUNC,$(1),$(wordlist 1,2,$(GO_SUPPORTED_ARCHS))))
endef

## Print
go-print: 
	@echo
	@echo -- GO --
	@echo GO_FSPATH: 				$(GO_FSPATH)
	@echo GO_PKG_LIST: 				$(GO_PKG_LIST)
	@echo GO_BUILD_OUT_FSPATH: 		$(GO_BUILD_OUT_FSPATH)
	@echo GO_EXT_DEPS:              $(GO_EXT_DEPS)
	@echo GO_SUPPORTED_PLATFORMS:   $(GO_SUPPORTED_PLATFORMS)
	@echo GO_SUPPORTED_ARCHS:		$(GO_SUPPORTED_ARCHS)
	@echo GO_BUILD_OUT_ALL_FSPATH:	$(GO_BUILD_OUT_ALL_FSPATH)

	@echo


## Build the code
go-build:
	@echo Building
	cd $(GO_FSPATH) && go build -v -o $(GO_BUILD_OUT_FSPATH) .

go-build-all:
	@echo "Building for all supported archs and platforms"
	mkdir -p $(GO_BUILD_OUT_ALL_FSPATH)
	cd $(GO_FSPATH)
	$(foreach GOOS, $(GO_SUPPORTED_PLATFORMS),\
		$(call GO_BUILD_ALL_FUNC,$(GOOS)))

go-build-clean-all:
	@echo "Removing builds for all supported archs and platforms"
	rm -rf $(GO_BUILD_OUT_ALL_FSPATH)

## Clean golang OS caches
go-os-clean:

	# damn useful when things go to shit with go mod tools.
	
	# go stuff
	go clean -cache
	go clean -modcache
	go clean -testcache

## Updates go mod file
go-mod-fix:
	# whatever is needed here.
	go mod tidy

## Run the code
go-run:
	@echo Running
	cd $(GO_FSPATH) && go run -v .

## Format with go-fmt
go-fmt:
	@echo Formatting
	cd $(GO_FSPATH) && go fmt .

## Lint with golangci-lint
go-lint:
	@echo Linting
	cd $(GO_FSPATH) && golangci-lint run --no-config --issues-exit-code=0 --timeout=5m

## Run the tests
go-test:
	@echo Running tests
	cd $(GO_FSPATH) && go test -race -v .

## Run the tests with coverage
go-test-coverage:
	@echo Running tests with coverage
	cd $(GO_FSPATH) && go test -short -coverprofile cover.out -covermode=atomic ${GO_PKG_LIST}

## Display test coverage
go-display-coverage:
	@echo Displaying test coverage
	cd $(GO_FSPATH) && go tool cover -html=cover.out

## Get external dependencies
go-exts-get:
	$(foreach DEPS, $(GO_EXT_DEPS), \
		$(call GO_INSTALL_DEPS_FUNC,$(DEPS)))

## Cleans external dependencies
go-exts-clean:
	$(foreach DEPS, $(GO_EXT_DEPS), $(call GO_UNINSTALL_DEPS_FUNC,$(DEPS)))
