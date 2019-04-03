.DEFAULT_GOAL := build
VERSION="0.1"
REPO="jasonrichardsmith/mwc-example"

build:
	docker build --no-cache -t jasonrichardsmith/mwc-example:${VERSION} .
	
minishift: minishiftcontext build

minishiftcontext:
	eval $(minishift docker-env)
push:
	docker push ${REPO}:${VERSION}
