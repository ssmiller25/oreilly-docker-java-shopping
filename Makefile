DOCKER_REPO="ssmiller25"

.PHONY: build
build:
	@docker build -t ${DOCKER_REPO}/djshopfront shopfront/
	@docker build -t ${DOCKER_REPO}/djproductcatalogue productcatalogue/
	@docker build -t ${DOCKER_REPO}/djstockmanager stockmanager/

.PHONY: push
push:
	@docker push ${DOCKER_REPO}/djshopfront
	@docker push ${DOCKER_REPO}/djproductcatalogue
	@docker push ${DOCKER_REPO}/djstockmanager