#Dockerfile vars
phpver=7.4

#vars
#IMAGENAME=zaxbux/wintercms
IMAGENAME=lineblocs/wintercms
REPO=docker.io
IMAGEFULLNAME=${REPO}/${IMAGENAME}

.PHONY: help build push all

help:
		@echo "Makefile arguments:"
		@echo ""
		@echo "phpver - PHP Version"
		@echo ""
		@echo "Makefile commands:"
		@echo "build"
		@echo "push"
		@echo "all"

.DEFAULT_GOAL := all

build:
		@docker build --build-arg PHP_VERSION=${phpver} -t ${IMAGEFULLNAME}:master -f php${phpver}/fpm-alpine/Dockerfile .

push:
		@docker push ${IMAGEFULLNAME}:master

all: build push