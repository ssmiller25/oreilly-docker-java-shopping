DOCKER_REPO="ssmiller25"

CIVO_CMD="civo"
# For Dockerize CIVO
#CIVO_CMD=docker run -it --rm -v /home/steve/.civo.json:/.civo.json civo/cli:latest

CLUSTER_NAME=k8s-intro
KUBECONFIG=kubeconfig.$(CLUSTER_NAME)
KUBECTL=kubectl --kubeconfig=$(KUBECONFIG)


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

.PHONY: civo-up
civo-up: $(KUBECONFIG)

$(KUBECONFIG):
	@echo "Creating $(CLUSTER_NAME)"
	@$(CIVO_CMD) k3s create $(CLUSTER_NAME) -n 3 --size g2.small --wait
	@$(CIVO_CMD) k3s config $(CLUSTER_NAME) > $(KUBECONFIG)

.PHONY: civo-down
civo-down:
	@echo "Removing $(CLUSTER_NAME)"
	@$(CIVO_CMD) k3s remove $(CLUSTER_NAME)
	@rm $(KUBECONFIG)