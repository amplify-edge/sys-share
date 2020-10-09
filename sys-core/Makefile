SHARED_FSPATH=./../../shared
BOILERPLATE_FSPATH=$(SHARED_FSPATH)/boilerplate

include $(BOILERPLATE_FSPATH)/help.mk
include $(BOILERPLATE_FSPATH)/os.mk
include $(BOILERPLATE_FSPATH)/gitr.mk
include $(BOILERPLATE_FSPATH)/tool.mk
include $(BOILERPLATE_FSPATH)/flu.mk
include $(BOILERPLATE_FSPATH)/go.mk


override FLU_SAMPLE_NAME =example
override FLU_LIB_NAME =client
override FLU_SAMPLE_FSPATH = $(PWD)/example/client/flu

EXAMPLE_EMAIL = superadmin@getcouragenow.org
EXAMPLE_PASSWORD = superadmin
EXAMPLE_SERVER_ADDRESS = 127.0.0.1:8888

this-all: this-build
	
## Print all settings
this-print-all: ## print
	@echo -- REPO -- 
	@echo REPOSITORY: $(REPOSITORY)
	@echo

	$(MAKE) os-print
	
	$(MAKE) flu-print

	$(MAKE) flu-gen-lang-print

	#$(MAKE) srv-print

this-build:
	@echo "Generating GRPC models and services for Go & Flutter"
	@mkdir -p service/{flu/lib,go}/rpc/v2
	@go generate

this-example-run:
	@echo Running Example Login Client
	./bin-all/cli/main auth-service login --email $(EXAMPLE_EMAIL) --password $(EXAMPLE_PASSWORD) --server-addr $(EXAMPLE_SERVER_ADDRESS)

this-example-register:
	@echo Running Example Register Client
	./bin-all/cli/main auth-service register --email $(EXAMPLE_EMAIL) --password $(EXAMPLE_PASSWORD) --password-confirm $(EXAMPLE_PASSWORD) --server-addr $(EXAMPLE_SERVER_ADDRESS)

this-example-flutter-run:
	@echo Running Example Flutter Client
	$(MAKE) flu-web-run
