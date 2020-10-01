# golang server tools

# NOTE: This make file is VERY much up in the air as to if we need it.


# Absolute File path to Server
SERVER_FSPATH=$(PWD)/../server

## Prints the Server settings
srv-print:
	@echo
	@echo -- SERVER -- 
	@echo SERVER_FSPATH: $(SERVER_FSPATH)
	@echo

## Runs the Server.
srv-run:


## Generates the environment settings for the Server.
srv-env:

	@echo PWD $(PWD)

	@echo GIT_ABS_REPO_FSPATH $(GIT_ABS_REPO_FSPATH)

	# change the MINIO_ACCESSKEY
	cd server && go-sed -e 's/MINIO_ACCESSKEY\=\s.*/MINIO_ACCESSKEY\=\ \"minio-joe"/g' < ENV-template > ENV-test

	#use: https://github.com/moul/protoc-gen-gotemplate/tree/master/examples

	#sed-go -e '/re/ { p ; d }' < in > out
	# go-sed -e 's/minio/minio-joe' < ENV-template > ENV-joe

    #ASSET_FILE=maintemplate/client/build/web/assets/assets/env.json
    #sed -i s/\\?version\=#\{ref\}/?version=$GITHUB_SHA/g maintemplate/client/build/web/index.html

	
## env
### Each dev can have their own ENV setting so they can code.  We use reflection, and so my env setting injection template is env-winwisely99 (my values)
### Then it spits out a env, by usign go-sed agaisnt the env-template.
### So env is NOT checked into git.

## JSON. 

## k8 stuff for local and CI.
## then get CI using make
## then kill the other CI workflows.
