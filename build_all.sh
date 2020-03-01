#!/bin/bash

cd shopfront
docker build -t ssmiller25/djshopfront . 
cd ..

cd productcatalogue
docker build -t ssmiller25/djproductcatalogue .
cd ..

cd stockmanager
docker build -t ssmiller25/djstockmanager . 
cd ..
