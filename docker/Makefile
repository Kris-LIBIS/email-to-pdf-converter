VERSION := 1.0
REGISTRY := registry.docker.libis.be
IMAGE := teneo/emailconverter
TAG := $(REGISTRY)/$(IMAGE):$(VERSION)

all: build push

build:
	docker build -t $(TAG) .

push:
	docker push $(TAG)
