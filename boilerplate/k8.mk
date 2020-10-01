# k8 for running k8 locally ( minikube) and remotely.

# also for running just with docker


## Prints the k8 settings
k8-print: ## os-print
	@echo
	@echo -- k8 --
	@echo GO_OS: $(GO_OS)
	@echo GO_ARCH: $(GO_ARCH)
	@echo


## Installs any things the OS needs
k8-dep: ## k8-dep
	# installs the things needed to run k8, docker etc

	bs gjgghg
