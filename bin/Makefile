
DOCKER_IMAGE := dockermgeo/dockerbase
CURDIR := $(shell pwd)
REGISTRY := mecy:5000

build:
				@echo "*** Build: $(REGISTRY)/$(DOCKER_IMAGE) ***"
				docker build -t $(REGISTRY)/$(DOCKER_IMAGE) .
				docker push $(REGISTRY)/$(DOCKER_IMAGE)

push_online:
				docker tag $(REGISTRY)/$(DOCKER_IMAGE) $(DOCKER_IMAGE)
				docker push $(DOCKER_IMAGE)

clean:
				cd ..
				rm -Rf $(CURDIR)
