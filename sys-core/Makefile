SHARED_FSPATH=./../../shared
BOILERPLATE_FSPATH=$(SHARED_FSPATH)/boilerplate

include $(BOILERPLATE_FSPATH)/help.mk
include $(BOILERPLATE_FSPATH)/os.mk
include $(BOILERPLATE_FSPATH)/gitr.mk
include $(BOILERPLATE_FSPATH)/tool.mk
include $(BOILERPLATE_FSPATH)/flu.mk


override FLU_SAMPLE_NAME = example
override FLU_SAMPLE_FSPATH = $(PWD)/example/client/flu
override FLU_LIB_NAME = mod_survey
override FLU_LIB_FSPATH = $(PWD)/service/flu
override FLU_LANG_LOCALIZATION_DIR = $(FLU_LIB_FSPATH)/lib/pkg/i18n

EXAMPLE_EMAIL = superadmin@getcouragenow.org
EXAMPLE_PASSWORD = superadmin
EXAMPLE_SERVER_ADDRESS = 127.0.0.1:8888

this-all: this-print this-build this-print-end

## Print all settings
this-print: ## print
	@echo
	@echo "-- SYS-CORE: start --"
	@echo

	$(MAKE) os-print

	$(MAKE) flu-print

	$(MAKE) flu-gen-lang-print


this-print-end:
	@echo
	@echo "-- SYS-CORE: end --"
	@echo


this-build: this-build-delete
	@echo 'Building example golang and flutter binaries'
	mkdir -p bin/all/{cli,client}/{go,flu}
	@echo 'Building Golang binaries'
	go build -v -o bin-all/cli/go/ ./example/cli/go/main.go
	@echo 'Building Flutter binary'
	$(MAKE) flu-web-build

this-build-delete:
	@echo 'Removing built go and flutter binaries'
	rm -rf bin-all/{cli,client,server}/{go,flu}/*

this-gen: this-gen-delete
	@echo "Generating GRPC models and services for Go & Flutter"
	@mkdir -p service/{flu/lib,go}/rpc/v2
	cd proto/v2/ && jb install && jb update
	@go generate
	@echo "Generating Flutter Config"

#   $(MAKE) flu-gen-all
#	$(MAKE) flu-gen-lang

this-gen-dep:
	GO111MODULE=on go get github.com/chrusty/protoc-gen-jsonschema/cmd/protoc-gen-jsonschema
	go install github.com/chrusty/protoc-gen-jsonschema/cmd/protoc-gen-jsonschema

this-config-gen: this-config-dep
	@echo Generating Config
	@mkdir -p service/flu/lib/assets
	jsonnet -S service/go/flutter_base_repo.jsonnet \
		-V SYS_CORE_HOST="127.0.0.1" \
		-V SYS_CORE_PORT="8888" \
		> ./service/flu/lib/assets/hostconfig.json

this-config-clean:
	@echo Deleting previously generated config
	rm -rf ./service/flu/lib/assets/hostconfig.json

this-config-dep:
	#cd service/go && jb install && jb update

this-gen-delete: this-config-clean
	@echo 'Removing generated protobuf definition (Go and Flutter)'
	rm -rf service/{flu/lib,go}/rpc/v2/*.{dart,go}

this-example-run:
	@echo Running Example Login Client
	./bin-all/cli/go/main auth-service login --email $(EXAMPLE_EMAIL) --password $(EXAMPLE_PASSWORD) --server-addr $(EXAMPLE_SERVER_ADDRESS)

this-example-register:
	@echo Running Example Register Client
	./bin-all/cli/go/main auth-service register --email $(EXAMPLE_EMAIL) --password $(EXAMPLE_PASSWORD) --password-confirm $(EXAMPLE_PASSWORD) --server-addr $(EXAMPLE_SERVER_ADDRESS)

this-example-flutter-web-run:
	@echo Running Example Flutter Client
	$(MAKE) flu-web-run

this-example-flutter-desk-run:
	@echo Running Example Flutter Desk Client
	# HAs a bug. Runs, but Desktop screen is black.
	$(MAKE) flu-desk-build