
# This make file uses composition to keep things KISS and easy.
# In the boilerpalte make files dont do any includes, because you will create multi permutations of possibilities.

BOILERPLATE_FSPATH=./boilerplate

include $(BOILERPLATE_FSPATH)/help.mk
include $(BOILERPLATE_FSPATH)/os.mk
include $(BOILERPLATE_FSPATH)/gitr.mk
include $(BOILERPLATE_FSPATH)/tool.mk
include $(BOILERPLATE_FSPATH)/flu.mk
include $(BOILERPLATE_FSPATH)/go.mk


# remove the "v" prefix
VERSION ?= $(shell echo $(TAGGED_VERSION) | cut -c 2-)

override FLU_SAMPLE_NAME =client
override FLU_LIB_NAME =client


CI_DEP=github.com/getcouragenow/sys
CI_DEP_FORK=github.com/joe-getcouragenow/sys


this-all: this-print this-dep this-build this-print-end
 
## Print all settings
this-print: 
	@echo
	@echo "-- sys-share: start --"
	@echo
	@echo

this-print-end:
	@echo
	@echo "-- sys-share: end --"
	@echo
	@echo

this-dep: grpc-all-git-delete grpc-all-git-clone grpc-go-build grpc-grpcui-build grpc-protoc-build


this-build:
	cd sys-account && $(MAKE) this-all
