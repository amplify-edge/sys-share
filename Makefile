# Download Booty
BOOTY_URL := https://raw.githubusercontent.com/amplify-edge/booty/master/scripts

ifeq ($(OS),Windows_NT)
	BOOTY_URL:=$(BOOTY_URL)/install.ps1
else
	BOOTY_URL:=$(BOOTY_URL)/install.sh
endif

SHELLCMD :=
ifeq ($(OS),Windows_NT)
	SHELLCMD:=iwr -useb $(BOOTY_URL) | iex
else
	SHELLCMD:=curl -fsSL $(BOOTY_URL) | bash
endif


all: print dep build print-end
 
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

dep:
	@echo $(BOOTY_URL)
	$(SHELLCMD)
	@booty install-all
	@booty extract includes

build:
	cd sys-core && $(MAKE) all
	cd sys-account && $(MAKE) all
