VERSION := 1.2
REGISTRY := registry.docker.libis.be
IMAGE := teneo/emailconverter
TAG := $(REGISTRY)/$(IMAGE):$(VERSION)
LATEST := $(REGISTRY)/$(IMAGE):latest

.PHONY: all compile build push

all: compile build push

compile:
	./gradlew shadowJar
	cp ./build/libs/emailconverter*.jar container/emailconverter.jar

build:
	docker build -t $(TAG) container
	docker image tag $(TAG) $(LATEST)

push:
	docker push $(TAG)
	docker push $(LATEST)
