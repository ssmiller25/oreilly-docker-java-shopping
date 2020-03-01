#!/bin/bash

cd shopfront
if docker build -t ssmiller25/djshopfront . ; then
  docker push ssmiller25/djshopfront
fi
cd ..

cd productcatalogue
if docker build -t ssmiller25/djproductcatalogue . ; then
  docker push ssmiller25/djproductcatalogue
fi
cd ..

cd stockmanager
if docker build -t ssmiller25/djstockmanager . ; then
  docker push ssmiller25/djstockmanager
fi
cd ..
