# grpc tools

# This puts everything onto the global path.
# Assumes you have Golang installed.
# Assumes you are on a MAC.


# Found from : https://github.com/lynxkite/lynxkite/blob/master/sphynx/proto_compile.sh

# Envoy
LIB_ENVOY=						github.com/tetratelabs/getenvoy
LIB_ENVOY_REPO_FSPATH=			$(GOPATH)/src/$(LIB_ENVOY)
LIB_ENVOY_GETENVOY_VERSION= 	v0.1.8
LIB_ENVOY_VERSION= 				standard:1.14.3

# grpcui is a golang Web GUI for GRPC
# https://github.com/fullstorydev/grpcui
LIB_GRPCUI_REPO=				github.com/fullstorydev/grpcui
LIB_GRPCUI_REPO_FSPATH=			$(GOPATH)/src/$(LIB_GRPCUI_REPO)

# GO GRPC is now here:https://github.com/grpc/grpc-go
LIB_GOGRPC_REPO=				github.com/grpc/grpc-go
LIB_GOGRPC_REPO_FSPATH=			$(GOPATH)/src/$(LIB_GOGRPC_REPO)
LIB_GOGRPC_REPO_VERSION= 		v1.32.0

# New
# https://github.com/protocolbuffers/protobuf-go
# which is https://godoc.org/google.golang.org/protobuf/cmd/protoc-gen-go
LIB_GO_REPO=					github.com/protocolbuffers/protobuf-go
LIB_GO_REPO_FSPATH=				$(GOPATH)/src/$(LIB_GO_REPO)
LIB_GO_REPO_VERSION= 			v1.25.0

# Old ( last update in 14 May, 2020, so very old )
# https://github.com/golang/protobuf/
LIB_GOOLD_REPO_REPO=			github.com/golang/protobuf
LIB_GOOLD_REPO_REPO_FSPATH=		$(GOPATH)/src/$(LIB_GOOLD_REPO_REPO)

# grpc-gateway & swagger
# https://github.com/grpc-ecosystem/grpc-gateway
# has github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
# has github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
LIB_GRPC_GATEWAY_REPO=			github.com/grpc-ecosystem/grpc-gateway
LIB_GRPC_GATEWAY_REPO_FSPATH=	$(GOPATH)/src/$(LIB_GRPC_GATEWAY_REPO)
LIB_GRPC_GATEWAY_REPO_VERSION=	v1.15.0

# Protoc
# All tags here: https://github.com/protocolbuffers/protobuf/tags
# For now just using Brew. Will upgrade to use a golang downloader soon.
LIB_PROTOC_VERSION=				3.13

## Print
grpc-print:
	@echo
	@echo -- Envoy --
	@echo LIB_ENVOY_REPO_FSPATH: 		$(LIB_ENVOY_REPO_FSPATH)
	@echo LIB_ENVOY_GETENVOY_VERSION: 	$(LIB_ENVOY_GETENVOY_VERSION)
	@echo LIB_ENVOY_VERSION: 			$(LIB_ENVOY_VERSION)

	@echo
	@echo -- GRPCUI GUI --
	@echo LIB_GRPCUI_REPO_FSPATH: 		$(LIB_GRPCUI_REPO_FSPATH)

	@echo
	@echo -- GO GRPC compiler --
	@echo LIB_GOGRPC_REPO_FSPATH: 		$(LIB_GOGRPC_REPO_FSPATH)
	@echo LIB_GOGRPC_REPO_VERSION: 		$(LIB_GOGRPC_REPO_VERSION)
	
	@echo
	@echo -- GO Protobuf compiler --
	@echo LIB_GO_REPO_FSPATH: 			$(LIB_GO_REPO_FSPATH)
	@echo LIB_GO_REPO_VERSION: 			$(LIB_GO_REPO_VERSION)
	
	@echo
	@echo -- OLD Golang Protobuf compiler --
	@echo LIB_GOOLD_REPO_REPO_FSPATH: 		$(LIB_GOOLD_REPO_REPO_FSPATH)

	@echo
	@echo -- GO GRPC Gateway compiler --
	@echo LIB_GRPC_GATEWAY_REPO_FSPATH: $(LIB_GRPC_GATEWAY_REPO_FSPATH)
	@echo LIB_GRPC_GATEWAY_REPO_VERSION: $(LIB_GRPC_GATEWAY_REPO_VERSION)
	
	@echo
	@echo -- Protoc compiler --
	@echo LIB_PROTOC_VERSION: 			$(LIB_PROTOC_VERSION)

	@echo

## All
grpc-all:
	#$(MAKE) grpc-all-delete
	$(MAKE) grpc-all-git-delete
	$(MAKE) grpc-all-git-clone
	$(MAKE) grpc-all-build
	$(MAKE) grpc-which

## Which
grpc-which:

	@echo
	@echo -- Start: GRPC-which --
	@echo


	@echo
	@echo -- envoy --
	@which envoy
	@envoy --version
	@echo

	@echo -- grpcli --
	@which grpc_cli
	@echo

	@echo
	@echo -- grpcui -- 
	@which grpcui
	@grpcui -version
	@echo

	@echo
	@echo -- protoc --
	@which protoc
	protoc --version
	@echo

	@echo
	@echo -- protoc-gen-go --
	@which protoc-gen-go
	@protoc-gen-go --version
	@echo

	@echo
	@echo -- protoc-gen-grpc-gateway --
	@which protoc-gen-grpc-gateway
	
	@echo
	@echo -- protoc-gen-swagger --
	@which protoc-gen-swagger

	@echo
	@echo -- protoc-gen-go-grpc --
	@which protoc-gen-go-grpc

	@echo

	@echo
	@echo -- End: GRPC-which --
	@echo


## All-git-clone
grpc-all-git-clone:
	# Envoy
	# See: https://github.com/pomerium/pomerium/blob/master/Makefile
	# this installs the getter into the GOBIN
	GO111MODULE=on go get $(LIB_ENVOY)/cmd/getenvoy@${LIB_ENVOY_GETENVOY_VERSION}

	# GRPCUI
	git clone https://$(LIB_GRPCUI_REPO) $(LIB_GRPCUI_REPO_FSPATH)

	# GRPC
	git clone https://$(LIB_GOGRPC_REPO) $(LIB_GOGRPC_REPO_FSPATH)
	cd $(LIB_GOGRPC_REPO_FSPATH) && git checkout $(LIB_GOGRPC_REPO_VERSION)

	# New golang protobuf compiler
	git clone https://$(LIB_GO_REPO) $(LIB_GO_REPO_FSPATH)
	cd $(LIB_GO_REPO_FSPATH) && git checkout $(LIB_GO_REPO_VERSION)

	# OLD golang protobuf compiler
	# git clone https://$(LIB_GOOLD_REPO_REPO) $(LIB_GOOLD_REPO_REPO_FSPATH)

	# GRPC Gateway compiler
	git clone https://$(LIB_GRPC_GATEWAY_REPO) $(LIB_GRPC_GATEWAY_REPO_FSPATH)
	cd $(LIB_GRPC_GATEWAY_REPO_FSPATH) && git checkout $(LIB_GRPC_GATEWAY_REPO_VERSION)
	

## All-git-delete
grpc-all-git-delete:
	rm -rf $(LIB_ENVOY_REPO_FSPATH)
	rm -rf $(LIB_GRPCUI_REPO_FSPATH)
	rm -rf $(LIB_GOGRPC_REPO_FSPATH)
	rm -rf $(LIB_GO_REPO_FSPATH)
	rm -rf $(LIB_GOOLD_REPO_REPO_FSPATH)
	rm -rf $(LIB_GRPC_GATEWAY_REPO_FSPATH)

grpc-all-vscode-add:
	code --add $(LIB_ENVOY_REPO_FSPATH) --reuse-window
	code --add $(LIB_GRPCUI_REPO_FSPATH) --reuse-window
	code --add $(LIB_GOGRPC_REPO_FSPATH) --reuse-window
	code --add $(LIB_GO_REPO_FSPATH) --reuse-window
	code --add $(LIB_GOOLD_REPO_REPO_FSPATH) --reuse-window
	code --add $(LIB_GRPC_GATEWAY_REPO_FSPATH) --reuse-window

## All-build
grpc-all-build: grpc-envoy-build grpc-go-build grpc-grpcui-build grpc-grpcli-build grpc-protoc-build

## All-delete
grpc-all-delete: grpc-envoy-delete grpc-go-delete grpc-grpcui-delete grpc-grpcli-delete grpc-protoc-delete


### ENVOY

## Envoy-build
grpc-envoy-build:
	@echo
	@echo -- Start: Envoy build --
	@echo

	# this pulls down envoy to /usr/local/bin
	# getenvoy is undefined
	# getenvoy fetch $(LIB_ENVOY_VERSION)
	# copy it to GOBIN.
	# cp -f /usr/local/bin/envoy $(GOPATH)/bin/envoy

	@echo
	@echo -- End: Envoy build --
	@echo

grpc-envoy-delete:
	@echo
	@echo -- Start: Envoy Delete --
	@echo

	rm -rf $(GOPATH)/bin/envoy



### GRPC CLI
grpc-grpcli-build:

	@echo
	@echo -- Start: grpccli build --
	@echo

	# grpc_cli tool to call the GRPC from command line, and do basic smoke tests
	# REPO: https://github.com/grpc/grpc/blob/master/doc/command_line_tool.md
	# Examples: https://medium.com/@at_ishikawa/use-grpc-cli-to-request-a-grpc-server-37219b33c94b
	# Is works by using Reflection: https://github.com/grpc/grpc-go/blob/master/Documentation/server-reflection-tutorial.md
	brew install grpc

	@echo
	@echo -- End: grpccli build --
	@echo

grpc-grpcli-delete:
	@echo
	@echo -- Start: GRPCLI Delete --
	@echo

	# grpc_cli
	brew uninstall grpc

### GRPCUI
grpc-grpcui-build:
	@echo
	@echo -- Start: GRPCUI build --
	@echo

	# instal to GOBIN
	cd $(LIB_GRPCUI_REPO_FSPATH)/cmd/grpcui && go install .

	@echo
	@echo -- End: GRPCUI build --
	@echo

grpc-grpcui-delete:
	@echo
	@echo -- Start: GRPCUI Delete --
	@echo

	rm -f $(GOPATH)/bin/grpcui


### Protoc basis

# Download and put into GOPATH also

grpc-protoc-build:
	@echo
	@echo -- protoc --

	# Protoc that is the basis
	brew install protobuf@$(LIB_PROTOC_VERSION)

grpc-protoc-delete:
	brew uninstall protobuf


### GO Protobuf generators 

grpc-go-build:
	@echo
	@echo -- Start: Golang PB build --
	@echo

	# Golang PB
	cd $(LIB_GO_REPO_FSPATH)/cmd/protoc-gen-go && go install .

	# Golang GRPC
	cd $(LIB_GOGRPC_REPO_FSPATH)/cmd/protoc-gen-go-grpc && go install .

	# Golang GRPC Gatway
	cd $(LIB_GRPC_GATEWAY_REPO_FSPATH)/protoc-gen-grpc-gateway && go install .

	# Golang Swagger
	cd $(LIB_GRPC_GATEWAY_REPO_FSPATH)/protoc-gen-swagger && go install .

	# Dart GRPC and Protobuf
	# NOT git cloned, but installed by Dart itself for Latest. If we hit probs then we can version it.
	# Assumes dart installed 
	# pub global activate protoc_plugin
	# this way we don't need separate dart installation, other than what's bundled with flutter
	flutter pub global activate protoc_plugin

	@echo
	@echo -- End: Golang PB build --
	@echo

grpc-go-delete:
	@echo
	@echo -- Start: Golang PB Delete --
	@echo

	rm -f $(GOPATH)/bin/protoc-gen-go
	rm -f $(GOPATH)/bin/protoc-gen-go-grpc
	rm -f $(GOPATH)/bin/protoc-gen-grpc-gateway
	rm -f $(GOPATH)/bin/protoc-gen-swagger
	
	



### Old GO Protobuf generators
	
grpc-pbold-build:
	@echo
	@echo -- Start: Golang PB-OLD build --
	@echo

	cd $(LIB_GOOLD_REPO_REPO_FSPATH)/protoc-gen-go && go install .


	@echo
	@echo -- End: Golang PB-OLD build --
	@echo

grpc-pbold-delete:
	@echo
	@echo -- Start: Golang PB-OLD Delete --
	@echo

	rm -f $(GOPATH)/bin/protoc-gen-go


export PROTO_SOURCE_DIR="proto"
export PROTO_SOURCE_FILE="sphynx.proto"
grpc-gen:
	@echo Generating Protos
	# Generate the gRPC Go interfaces using NEW compiler

	protoc ${PROTO_SOURCE_DIR}/${PROTO_SOURCE_FILE} --go-grpc_out=proto --go_out=proto
