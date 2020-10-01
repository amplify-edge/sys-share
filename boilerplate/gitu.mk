# git utils

# generic tools for git we need.

# inputs
GITU_REPO_SERVER=github.com
GITU_REPO_ORG=SOME-ORG
GITU_REPO_NAME=SOME-REPO
GITU_REPO_BRANCH=master
GITU_REPO_TAG=????
GITU_REPO_OUTROOT_FSPATH=$(GOPATH)/src

# calculated
GITU_LIB=$(GITU_REPO_SERVER)/$(GITU_REPO_ORG)/$(GITU_REPO_NAME)
export GITU_REPO_OUT_FSPATH=$(GITU_REPO_OUTROOT_FSPATH)/$(GITU_LIB)

## Print git utilities variables
gitu-print:
	@echo
	@echo -- GITU -- 
	@echo GITU_REPO_SERVER: 		$(GITU_REPO_SERVER)
	@echo GITU_REPO_ORG: 			$(GITU_REPO_ORG)
	@echo GITU_REPO_NAME: 			$(GITU_REPO_NAME)
	@echo GITU_REPO_BRANCH: 		$(GITU_REPO_BRANCH)
	@echo GITU_REPO_TAG: 			$(GITU_REPO_TAG)
	@echo calculated -
	@echo GITU_LIB: 				$(GITU_LIB)
	@echo GITU_REPO_OUT_FSPATH: 	$(GITU_REPO_OUT_FSPATH)
	

## Returns lib name
gitu-getlibpath:
	echo $(GITU_LIB)

## Returns destination file system path
gitu-getfspath:
	echo $(GITU_REPO_OUT_FSPATH)

gitu-clone:
	mkdir -p $(GITU_REPO_OUT_FSPATH)
	cd $(GITU_REPO_OUT_FSPATH) && cd .. && rm -rf $(GITU_REPO_NAME) && git clone https://git@$(GITU_LIB).git


## Clones a master
gitu-clone-master: gitu-clone
	cd $(GITU_REPO_OUT_FSPATH) && git checkout $(GITU_REPO_BRANCH)

	# return path
	#$(MAKE) gitu-getfspath

## Clones a tag
gitu-clone-tag: gitu-clone 
	cd $(GITU_REPO_OUT_FSPATH) && git checkout tags/$(GITU_REPO_TAG)
	
	# return path
	#$(MAKE) gitu-getfspath

gitu-pull:
	## not used but likely will be later...
	cd $(GITU_REPO_OUT_FSPATH) && git pull

## Deletes a repo from disk
gitu-delete:
	rm -rf $(GITU_REPO_OUT_FSPATH)









