include ./../../fly.mk

### FLY 
FLY_CODE_PATH=$(PWD)/wg		# Path to the code to deploy.
FLY_APP_BUILTIN=go					# fly Buildin to use (go, other)
FLY_APP_NAME=joe-wg					# fly app name
FLY_APP_ORG=personal				# fly org
FLY_APP_PORT=8080					# the Port our server needs to listen on.
FLY_DNS_DOMAIN=getcourage.org
FLY_DNS_SUBDOMAIN=joe-wg

WG_CLIENT_URL=https://www.wireguard.com/install/

print:
	$(MAKE) fly-print