VERSION := 1.0
REGISTRY := registry.docker.libis.be
IMAGE := teneo/emailconverter
TAG := $(REGISTRY)/$(IMAGE):$(VERSION)
LATEST := $(REGISTRY)/$(IMAGE):latest

.PHONY: build
build:
	./gradlew shadowJar
	cp ./build/libs/emailconverter*.jar docker/emailconverter.jar
	docker build -t $(TAG) docker
	docker build -t $(LATEST) docker
	docker push $(TAG)
	docker push $(LATEST)
