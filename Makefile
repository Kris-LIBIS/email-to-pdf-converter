VERSION := 1.1
REGISTRY := registry.docker.libis.be
IMAGE := teneo/emailconverter
TAG := $(REGISTRY)/$(IMAGE):$(VERSION)
LATEST := $(REGISTRY)/$(IMAGE):latest

.PHONY: build
build:
	./gradlew shadowJar
	cp ./build/libs/emailconverter*.jar container/emailconverter.jar
	docker build -t $(TAG) container
	docker build -t $(LATEST) container
	docker push $(TAG)
	docker push $(LATEST)
