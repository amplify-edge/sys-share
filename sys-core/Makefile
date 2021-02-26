BOILERPLATE_FSPATH=../includes

include $(BOILERPLATE_FSPATH)/help.mk
include $(BOILERPLATE_FSPATH)/flu.mk


override FLU_SAMPLE_NAME = example
override FLU_SAMPLE_FSPATH = $(PWD)/example/client/flu
override FLU_LIB_NAME = mod_survey
override FLU_LIB_FSPATH = $(PWD)/service/flu
override FLU_LANG_LOCALIZATION_DIR = $(FLU_LIB_FSPATH)/lib/pkg/i18n

all: print build print-end

## Print all settings
print: ## print
	@echo
	@echo "-- SYS-CORE: start --"
	@echo
	booty os-print
	$(MAKE) flu-print
	$(MAKE) flu-gen-lang-print


print-end:
	@echo
	@echo "-- SYS-CORE: end --"
	@echo


build: build-delete
	@echo 'Building example golang and flutter binaries'
	mkdir -p bin/all/{cli,client}/{go,flu}
	@echo 'Building Golang binaries'
	go build -v -o bin-all/cli/go/ ./example/cli/go/main.go
	@echo 'Building Flutter binary'
	$(MAKE) flu-web-build

build-delete:
	@echo 'Removing built go and flutter binaries'
	rm -rf bin-all/{cli,client,server}/{go,flu}/*

gen: gen-delete
	@echo "Generating GRPC models and services for Go & Flutter"
	@mkdir -p service/{flu/lib,go}/rpc/v2
	@go generate
	@echo "Generating Flutter Config"

	# $(MAKE) flu-gen-all
	# $(MAKE) flu-gen-lang

gen-delete:
	@echo 'Removing generated protobuf definition (Go and Flutter)'
	rm -rf service/{flu/lib,go}/rpc/v2/*.{dart,go}

example-flutter-web-run:
	@echo Running Example Flutter Client
	$(MAKE) flu-web-run

example-flutter-desk-run:
	@echo Running Example Flutter Desk Client
	# HAs a bug. Runs, but Desktop screen is black.
	$(MAKE) flu-desk-build
