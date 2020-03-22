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
* build_all.sh
  * Convenience shell script for triggering Maven builds of all of the application microservices, all within a Docker container. 
* build_all_and_publish_dockerhub.yml
  * Convenience build and publish shell script for triggering Maven builds within Docker of all of the application microservices, and (if successful) a push of the image to DockerHub. If you wish to use this script you will have to create a DockerHub account and substitute the existing account details ('ssmiller25') with your own.
* docker-compose.yml
 * [Docker Compose](https://docs.docker.com/compose/) file that starts all of the DJShopping application microservice containers. Note that if you push your own version of the Docker images to your DockerHub account you will have to change the image names details within this file to run these (i.e. remove the 'ssmiller25' account name)
 * Run the file via the command `docker-compose up`
* docker-compose-build.yml
  * [Docker Compose](https://docs.docker.com/compose/) file that contains the build configuration of the DJShopping application microservices.
  * Build the Docker images via the command `docker-compose -f docker-compose-build.yml build`
  * Build and run the Docker images via the command `docker-compose -f docker-compose-build.yml up --build`
