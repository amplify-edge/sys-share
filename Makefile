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
	booty extract includes
	cd sys-core && $(MAKE) all
	cd sys-account && $(MAKE) all
