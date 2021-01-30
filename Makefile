git_hash = $(shell git rev-parse --short -q HEAD)
maven_version = 3-jdk-8
jdk_version = 8-jre
DOCKER_REPO=quay.io/ssmiller25

CIVO_CMD="civo"
# For Dockerize CIVO
#CIVO_CMD=docker run -it --rm -v /home/steve/.civo.json:/.civo.json civo/cli:latest

CLUSTER_NAME=k8s-intro
KUBECONFIG=kubeconfig.$(CLUSTER_NAME)
KUBECTL=kubectl --kubeconfig=$(KUBECONFIG)


.PHONY: build
build:
	@docker build -t ${DOCKER_REPO}/djshopfront:${git_hash} shopfront/
	@docker build -t ${DOCKER_REPO}/djproductcatalogue:${git_hash} productcatalogue/
	@docker build -t ${DOCKER_REPO}/djstockmanager:${git_hash} stockmanager/

.PHONY: push
push:
	@for image in djshopfront djproductcatalogue djstockmanager; do \
		docker tag ${DOCKER_REPO}/${image}:${git_hash} ${DOCKER_REPO}/${image}:latest; \
		docker push ${DOCKER_REPO}/${image}:${git_hash}; \
	done

maven:${maven_version}
# Pull and cache dependent images
.PHONY: 
cache-upstream:
	docker pull maven:${maven_version}
	docker pull openjdk:${jdk_version}
	docker tag maven:${maven_version} $(DOCKER_REPO)/maven:${maven_version}
	docker tag openjdk:${jdk_version} $(DOCKER_REPO)/openjdk:${jdk_version}
	docker push $(DOCKER_REPO)/maven:${maven_version}
	docker push $(DOCKER_REPO)/openjdk:${jdk_version}

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



