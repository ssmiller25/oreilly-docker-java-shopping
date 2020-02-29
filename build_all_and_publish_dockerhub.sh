#!/bin/bash

cd shopfront
mvn clean install
if docker build -t ssmiller25/djshopfront . ; then
  docker push ssmiller25/djshopfront
fi
cd ..

cd productcatalogue
mvn clean install
if docker build -t ssmiller25/djproductcatalogue . ; then
  docker push ssmiller25/djproductcatalogue
fi
cd ..

cd stockmanager
mvn clean install
if docker build -t ssmiller25/djstockmanager . ; then
  docker push ssmiller25/djstockmanager
fi
cd ..
