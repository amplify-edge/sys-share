include ./../../os.mk
include ./../../dwn.mk
include ./../../hug.mk
include ./../../fly.mk

include ./fix/fix.mk

### HUGO Example
# https://github.com/cloudfoundry-incubator/quarks-docs
HUGO_EX_GITHUB_FILE=quarks-docs
HUGO_EX_GITHUB_URL=https://github.com/cloudfoundry-incubator/$(HUGO_EX_GITHUB_FILE)
HUGO_EX_CODE_FSPATH=$(PWD)/$(HUGO_EX_GITHUB_FILE)

# FIXES to the HUGO site.
FIX_HUGO_TARGET_FSPATH=$(HUGO_EX_CODE_FSPATH)
FIX_HUGO_SOURCE_FSPATH=$(PWD)/fix

### FLY Deployment Variables
FLY_CODE_PATH=$(HUGO_EX_CODE_FSPATH)/public
FLY_APP_BUILTIN=static
FLY_APP_NAME=joe-docs
FLY_APP_ORG=personal
FLY_APP_PORT=8080

FLY_DNS_DOMAIN=fly.dev 
FLY_DNS_SUBDOMAIN=joe-docs
FLY_PROD_DNS_DOMAIN=getcourage.org
FLY_PROD_DNS_SUBDOMAIN=docs


#DEPLOY_ENV=PROD
DEPLOY_ENV=DEV

DEPLOY_BASEURL=
ifeq ($(DEPLOY_ENV),PROD)
    DEPLOY_BASEURL=http://$(FLY_PROD_DNS_SUBDOMAIN).$(FLY_PROD_DNS_DOMAIN) 
endif
ifeq ($(DEPLOY_ENV),DEV)
     DEPLOY_BASEURL=http://$(FLY_DNS_SUBDOMAIN).$(FLY_DNS_DOMAIN)
endif



print:
	@echo 
	$(MAKE) hug-print
	$(MAKE) fly-print
	$(MAKE) fix-print
	@echo

	@echo -- HUGO EX --
	@echo HUGO_EX_GITHUB_FILE: $(HUGO_EX_GITHUB_FILE)
	@echo HUGO_EX_GITHUB_URL: $(HUGO_EX_GITHUB_URL)
	@echo HUGO_EX_CODE_FSPATH: $(HUGO_EX_CODE_FSPATH)
	@echo


	@echo -- DEPLOY environment --
	@echo DEPLOY_ENV: $(DEPLOY_ENV)
	@echo DEPLOY_BASEURL: $(DEPLOY_BASEURL)
	@echo

dep-os: dep-os-delete
	$(MAKE) hug-dep
	$(MAKE) fly-dep
dep-os-delete:
	$(MAKE) hug-dep-delete
	$(MAKE) fly-dep-delete


### HUGO

hugo-clone: hugo-delete
	git clone --recurse-submodules --depth 1  $(HUGO_EX_GITHUB_URL)
	# take a backup of the fixes.
	$(MAKE) fix-backup
hugo-delete:
	rm -rf $(HUGO_EX_CODE_FSPATH)

hugo-fix:
	$(MAKE) fix-run


### RUN

local-run:
	# leave running and it will update the site as you make changes
	cd $(HUGO_EX_CODE_FSPATH) && $(HUG_BIN) server
local-open:
	# opens browser to local deployed site.
	open http://localhost:1313


### DEPLOY

deploy-init:
	# shitty npm stuff
	npm install -g postcss-cli
	npm install autoprefixer
	npm audit fix

	$(MAKE) fly-init
deploy-delete:
	$(MAKE) fly-destroy
deploy-watch:
	# leave running and it update you with the changes to the deployment as it happens.
	$(MAKE) fly-status
deploy-run:
	# build the hugo site to public folder
	cd $(HUGO_EX_CODE_FSPATH) && mkdir -p public
	cd $(HUGO_EX_CODE_FSPATH) && HUGO_ENV=production $(HUG_BIN) --gc --baseURL $(DEPLOY_BASEURL) -d ./public
	$(MAKE) fly-deploy
deploy-open:
	# opens browser to deployed site.
	$(MAKE) fly-open



