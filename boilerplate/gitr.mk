
# git general stuff

# hardcoded
GITR_SERVER ?= github.com
GITR_ORG_UPSTREAM ?= getcouragenow

# reflected
GITR_ORG_FORK=$(shell basename $(dir $(abspath $(dir $$PWD))))
GITR_USER=$(GITR_ORG_FORK)
GITR_REPO_NAME=$(notdir $(shell pwd))
GITR_LAST_TAG=$(shell git describe --exact-match --tags $(shell git rev-parse HEAD))

# calculated
# upstream
GITR_REPO_UPSTREAM_ABS_URL=https:///$(GITR_SERVER)/$(GITR_ORG_UPSTREAM)/$(GITR_REPO_NAME)

GITR_REPO_ABS_URL=https:///$(GITR_SERVER)/$(GITR_ORG_FORK)/$(GITR_REPO_NAME)
GITR_REPO_ABS_FSPATH=$(GOPATH)/src/$(GITR_SERVER)/$(GITR_ORG_FORK)/$(GITR_REPO_NAME)

# remove the "v" prefix
GITR_VERSION ?= $(shell echo $(TAGGED_VERSION) | cut -c 2-)


## Prints the git setting
gitr-print:
	@echo
	@echo -- GITR Upstream --
	@echo GITR_ORG_UPSTREAM: 			$(GITR_ORG_UPSTREAM)
	@echo GITR_REPO_UPSTREAM_ABS_URL: 	$(GITR_REPO_UPSTREAM_ABS_URL)
	
	@echo -- GITR Fork --
	@echo GITR_ORG_FORK: 				$(GITR_ORG_FORK)
	@echo GITR_SERVER: 					$(GITR_SERVER)
	@echo GITR_USER: 					$(GITR_USER)
	@echo GITR_REPO_NAME: 				$(GITR_REPO_NAME)

	@echo ---
	@echo GITR_REPO_ABS_URL: 			$(GITR_REPO_ABS_URL)
	@echo GITR_REPO_ABS_FSPATH: 		$(GITR_REPO_ABS_FSPATH)

	@echo ---
	@echo GITR_VERSION: 				$(GITR_VERSION)
	@echo GITR_LAST_TAG:				$(GITR_LAST_TAG)
	
	@echo


### GIT-FORK

#See: https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/syncing-a-fork


gitr-upstream-open:
	open https://$(GITR_SERVER)/$(GITR_ORG_UPSTREAM)/$(GITR_REPO_NAME).git 
	

## Opens the forked git server.
gitr-fork-open:
	open $(GITR_REPO_ABS_URL).git


## Sets up the git fork locally.
gitr-fork-setup:
	# Pre: you git forked ( via web) and git cloned (via ssh)
	# add upstream repo
	git remote add upstream git://$(GITR_SERVER)/$(GITR_ORG_UPSTREAM)/$(GITR_REPO_NAME).git

## Sync upstream with your fork. Use this to make a PR.
gitr-fork-catchup:
	# This fetches the branches and their respective commits from the upstream repository.
	git fetch upstream 

	# This brings your fork's master branch into sync with the upstream repository, without losing your local changes.
	git merge upstream/master


## GIT-TAG

## Create a tag.
gitr-tag-create:
	# this will create a local tag on your current branch and push it to Github.

	git tag $(GIT_TAG_NAME)

	# push it up
	git push origin --tags

## Deletes a tag.
gitr-tag-delete:
	# this will delete a local tag and push that to Github

	git push --delete origin $(GIT_TAG_NAME)
	git tag -d $(GIT_TAG_NAME)

## GIT-RELEASE

## Stage a release (usage: make release-tag VERSION={VERSION_TAG})
gitr-release-tag:
	@echo Tagging release with version "${VERSION}"
	@git tag -a ${VERSION} -m "chore: release version '${VERSION}'"
	@echo Generating changelog
	@git-chglog -o CHANGELOG.md
	@git add CHANGELOG.md
	@git commit -m "chore: update changelog for version '${VERSION}'"

## Push a release (warning: ensure the release was staged first)
gitr-release-push: 
	@echo Publishing release
	@git push --follow-tags