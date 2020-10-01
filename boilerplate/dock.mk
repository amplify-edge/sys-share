# docker utils

DOCK_BIN_NAME=docker
DOCKMAC_BIN_NAME=docker-machine

DOCK_IMAGE=???

dock-print:
	@echo DOCK_IMAGE: $(DOCK_IMAGE)

## docker version
dock-version:
	$(DOCK_BIN_NAME) version

## dock-install
dock-install:
	# assume MAC for now
	# Should maybe move this to the BS OS code...
	brew cask install docker
	brew install docker-machine
	docker-machine create --driver virtualbox default
	docker-machine restart
	docker-machine env
	docker-machine regenerate-certs default

## dock-env-get
dock-env-get:
	# this command to configure your shell
	eval $(docker-machine env)

## dock-clean-all
dock-clean-all:
	# purge all images etc
	# See: https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes
	docker system prune -a

## dock-clean
dock-clean:
	# purgedocker based on variable.
	# See: https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes
	



## docker run
dock-run:

dock-stop-all:

dock-stop:

	