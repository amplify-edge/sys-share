# help

# Note assumes AWK is installed

.DEFAULT_GOAL       := help
HELP_TARGET_MAX_CHAR_NUM := 20

HELP_GREEN  := $(shell tput -Txterm setaf 2)
HELP_YELLOW := $(shell tput -Txterm setaf 3)
HELP_WHITE  := $(shell tput -Txterm setaf 7)
HELP_RESET  := $(shell tput -Txterm sgr0)


# Print help
help:

	@echo ''
	@echo 'Usage:'
	@echo '  ${HELP_YELLOW}make${HELP_RESET} ${HELP_GREEN}<target>${HELP_RESET}'
	@echo ''
	@echo 'Targets:'
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "  ${HELP_YELLOW}%-$(HELP_TARGET_MAX_CHAR_NUM)s${HELP_RESET} ${HELP_GREEN}%s${HELP_RESET}\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

# generic variable loader
VARS_OLD := $(.VARIABLES)

## Print our variables 
help-print-var:
	# generic printer
	# TODO: Add sorting !!
	$(foreach v, \
	$(filter-out $(VARS_OLD) VARS_OLD,$(.VARIABLES)), \
	$(info ${HELP_YELLOW} $(v) = ${HELP_RESET} ${HELP_GREEN} $($(v))))

## Print all variables
help-print-varall:
	# this our variables plus everything else loaded by the OS
	# TODO: add some form of categorisation if we can.
	@echo "${.VARIABLES}" | tr ' ' '\n'
	@echo BS_ROOT_FSPATH: 	$(BS_ROOT_FSPATH)

	@echo GO_ARCH: 	$(GO_ARCH)


	