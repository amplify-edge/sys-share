# git include
BOILERPLATE_FSPATH=./../boilerplate
include $(BOILERPLATE_FSPATH)/help.mk
include $(BOILERPLATE_FSPATH)/os.mk
include $(BOILERPLATE_FSPATH)/tool.mk
include $(BOILERPLATE_FSPATH)/flu.mk
include $(BOILERPLATE_FSPATH)/go.mk
include $(BOILERPLATE_FSPATH)/grpc.mk


override FLU_SAMPLE_NAME =example
override FLU_LIB_NAME =client
override FLU_SAMPLE_FSPATH = $(PWD)/main/client

## Print all settings
this-print: ## print
	@echo -- REPO -- 
	@echo REPOSITORY: $(REPOSITORY)
	@echo

	$(MAKE) os-print
	
	$(MAKE) flu-print

	$(MAKE) flu-gen-lang-print

	#$(MAKE) srv-print

## Get dependencies for building
this-dep: grpc-all-git-delete grpc-all-git-clone grpc-go-build grpc-grpcui-build grpc-protoc-build

## This builds everything
this-build:
	@echo "Generating GRPC models and services for Go & Flutter"
	@mkdir -p server/rpc/v2
	#@mkdir -p client/lib/api/v2
	@go generate

## Build and Run Server Example (Temporary until structure/stack is fixed)
this-run-example: this-build
	@echo Running Example Server
	$(GO_LIB_FSPATH)/bin-all/authserver

this-run-example-ui:
	@echo Running grpc-ui
	@grpcui -plaintext localhost:8888
