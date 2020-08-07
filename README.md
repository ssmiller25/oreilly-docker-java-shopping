# K8S Intro with O'Reilly's Docker Java Shopping

This repo is a modification of the original [Docker Java Shopping](https://github.com/danielbryantuk/oreilly-docker-java-shopping) for use in my [Kubernetes Intro Presentation](https://github.com/ssmiller25/k8s-intro).  The original book and
repo are still great, but this will be updated with more modern build and deployment configurations.

The original readme is at [README-orig.md](README-orig.md).  You may wish to switch to the master branch as well for all code examples.

# oreilly-docker-java-shopping
This repo contains code samples from my (Daniel Bryant) O'Reilly minibook ["Containerizing Continuous Delivery in Java: Docker Integration for Build Pipelines and Application Architecture"](https://www.nginx.com/resources/library/containerizing-continuous-delivery-java/).

This README is intended to provide high-level guidance of the project, and detailed instructions can be found in the accompanying book.

## Project Structure

* shopfront
 * The 'shopfront' microservice of the DJShopping example application that provides the primary entry point for the end-user (both Web UI and API-driven)
* productcatalogue
  * The 'product catalogue' microservice of the DJShopping example application, which provides product details like name and price
* stockmanager
  * The 'stock manager' microservice of the DJShopping example application, which provides stock information, such as SKU and quantity
* deploy
  * Kubernetes manifests and Kustomize header to allow for easy deployment.
