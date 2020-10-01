
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
this-all: 

	# Need shared repo. 
	# Want to use make and not github actions
	# - Need to knwo if on a fork or not.
	# 1. Do a git clone to the corect GOAPTH.
	# 2. check if the folder is there, and if not do a git clone.

	
	@echo Need to get tools and install



## Print all settings
this-print: ## print
	
	$(MAKE) os-print
	
	$(MAKE) gitr-print
	
	$(MAKE) flu-print

	$(MAKE) flu-gen-lang-print

	$(MAKE) go-print

this-dep:
	# LOCAL DEVS: go to root make file and call this yourself to get all the tools !!!!
	# install tools
	cd ./tool && $(MAKE) this-build

	# Install our grpc tools
	#$(MAKE) grpc-all

### CI

## Build for CI. Does Big Gen !
this-build: this-dep
	# Does full gen and build (web)
	cd ./maintemplate && $(MAKE) this-build

## Build Desk For CI. Does Big Gen !
this-flu-desk-build: this-dep
	cd ./maintemplate && $(MAKE) flu-desk-build

### Developers

# NOTE: At dev time you only want to run long generators IF you know you need then.
# So here are the make targets to use as you see fit.
# Manaully do a "make this-dep" to get the golang tools yourself.
# Manaully do a "make flu-config" to set to beta channnel yourself.
# Manaully do a "make flu-gen-all" to gen all code yourself.
# Manually do a "make flu-gen-lang-all" to gen all languages yourself.

### For Local dev. Does NOT do big Gen !
this-flu-desk-run:

	cd ./maintemplate && $(MAKE) flu-desk-run

### For Local dev. Does NOT do big Gen !
this-flu-web-run:
	

	cd ./maintemplate && $(MAKE) flu-web-run
