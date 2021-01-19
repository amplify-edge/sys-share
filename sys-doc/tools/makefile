FLY=flyctl			# installed

include ./../../fly.mk

# local CODE_PATH to the code
CODE_PATH=$(PWD)/cmd/server
CLI_CODE_PATH=$(PWD)/cmd/cli

APP_BUILTIN=go					# fly Buildin to use (go, other)
APP_NAME=joe-goproject			# fly app name
APP_ORG=personal				# fly org
APP_PORT=8080					# the Port our server needs to listen on.

DNS_DOMAIN=getcourage.org		# Domain for Certs
DNS_SUBDOMAIN=joe-goproject		# SubDomain for Certs

print:
	$(MAKE) fly-print

cli-run:
	cd $(CLI_CODE_PATH) && go run main.go
srv-run:
	go-bindata -fs -nomemcopy -o main/server/assets.go -prefix "client/build/web/" client/build/web/...
	go-bindata -fs -nomemcopy -o $(CODE_PATH)/assets.go -prefix "client/build/web/" assets/...
	cd $(CODE_PATH) && go run main.go
	#go run $(CODE_PATH)/main.go


