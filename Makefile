SHARED_FSPATH=./../shared
BOILERPLATE_FSPATH=$(SHARED_FSPATH)/boilerplate

include $(BOILERPLATE_FSPATH)/help.mk
include $(BOILERPLATE_FSPATH)/os.mk
include $(BOILERPLATE_FSPATH)/gitr.mk
include $(BOILERPLATE_FSPATH)/flu.mk
include $(BOILERPLATE_FSPATH)/go.mk

all: print build print-end
 
## Print all settings
print:
	@echo
	@echo "-- SYS-SHARE: start --"
	@echo
	@echo

print-end:
	@echo
	@echo "-- SYS-SHARE: end --"
	@echo
	@echo

build:
	cd sys-core && $(MAKE) all
	cd sys-account && $(MAKE) all
