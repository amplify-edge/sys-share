include ./../../os.mk
include ./../../dwn.mk
include ./../../hug.mk
include ./../../fly.mk

### FLY 
FLY_CODE_PATH=$(HUGO_EX_CODE_FSPATH)/userguide		# Path to the code to deploy.
FLY_APP_BUILTIN=static					# fly Buildin to use (go, other)
FLY_APP_NAME=joe-docs			# fly app name
FLY_APP_ORG=personal				# fly org
FLY_APP_PORT=8080					# the Port our server needs to listen on.
FLY_DNS_DOMAIN=getcourage.org
FLY_DNS_SUBDOMAIN=joe-docs

### HUGO Example
# https://github.com/google/docsy-example
HUGO_EX_GITHUB_FILE=docsy
HUGO_EX_GITHUB_URL=https://github.com/google/$(HUGO_EX_GITHUB_FILE)
HUGO_EX_CODE_FSPATH=$(PWD)/$(HUGO_EX_GITHUB_FILE)

print:
	@echo 
	$(MAKE) hug-print
	$(MAKE) fly-print
	@echo

	@echo -- HUGO EX --
	@echo HUGO_EX_GITHUB_FILE: $(HUGO_EX_GITHUB_FILE)
	@echo HUGO_EX_GITHUB_URL: $(HUGO_EX_GITHUB_URL)
	@echo HUGO_EX_CODE_FSPATH: $(HUGO_EX_CODE_FSPATH)
	@echo

dep-os: dep-os-delete
	$(MAKE) hug-dep
	$(MAKE) fly-dep
dep-os-delete:
	$(MAKE) hug-dep-delete
	$(MAKE) fly-dep-delete


dep-ex: dep-ex-delete
	git clone --recurse-submodules --depth 1  $(HUGO_EX_GITHUB_URL)
dep-ex-delete:
	rm -rf $(HUGO_EX_CODE_FSPATH)

fix:
	# TODO If else for each OS.
	sudo launchctl limit maxfiles 65535 200000
	ulimit -n 65535
	sudo sysctl -w kern.maxfiles=100000
	sudo sysctl -w kern.maxfilesperproc=65535


local-run:
	# leave running and it will update the site as you make changes
	cd $(HUGO_EX_CODE_FSPATH)/userguide && $(HUG_BIN) server --themesDir ../..
local-open:
	# opens browser to local deployed site.
	open http://localhost:1313/



deploy-watch:
	# leave running and it update you with the changes to the deployment as it happens.
	$(MAKE) fly-status
deploy-run:
	# build the hugo site to public folder
	cd $(HUGO_EX_CODE_FSPATH)/userguide && rm -rf public/
	cd $(HUGO_EX_CODE_FSPATH)/userguide && $(HUG_BIN) --gc

	$(MAKE) fly-deploy
deploy-open:
	# opens browser to deployed site.
	$(MAKE) fly-open



