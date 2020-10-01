# os tools

export GO_OS 		:= $(shell go env GOOS)
export GO_ARCH		?= $(shell go env GOARCH)

## Prints the OS settings
os-print:
	@echo
	@echo -- OS --
	@echo GO_OS: $(GO_OS)
	@echo GO_ARCH: $(GO_ARCH)
	@echo


## Installs any things the OS needs
os-dep:
	# TODO: grab Boostrapper
	# TODO: scaffold out the boilerplate.
