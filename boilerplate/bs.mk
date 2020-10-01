# bs utils


# NOTE: exported as needed by other make files !
export BS_ROOT_FSPATH := 	$(GOPATH)/src/bin

export BS_NAME := 			bs
export BS_FSPATH := 		$(BS_ROOT_FSPATH)/$(BS_NAME)

export BS_LANG_NAME := 		bs-lang
export BS_LANG_FSPATH := 	$(BS_ROOT_FSPATH)/$(BS_LANG_NAME)

export BS_HOVER_NAME := 	bs-hover
export BS_HOVER_FSPATH := 	$(BS_ROOT_FSPATH)/$(BS_HOVER_NAME)


## Prints the BS settings
bs-print:
	@echo
	@echo -- BS --
	@echo BS_NAME: 			$(BS_NAME)
	@echo BS_FSPATH			$(BS_FSPATH)

	@echo BS_LANG_NAME: 	$(BS_LANG_NAME)
	@echo BS_LANG_FSPATH: 	$(BS_LANG_FSPATH)

	@echo BS_HOVER_NAME: 	$(BS_HOVER_NAME)
	@echo BS_HOVER_FSPATH: 	$(BS_HOVER_FSPATH)
	
	@echo

