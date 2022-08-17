#! /bin/bash
docker login jupyterimages.azurecr.io
docker build -f ./Dockerfile-Python -t jupyterimages.azurecr.io/datascience:latest .
docker push jupyterimages.azurecr.io/datascience
docker build -f ./Dockerfile-Spark -t jupyterimages.azurecr.io/spark:latest .
docker push jupyterimages.azurecr.io/spark
docker build -f ./Dockerfile-tensorflow -t jupyterimages.azurecr.io/tensorflow:latest .
docker push jupyterimages.azurecr.io/tensorflow
docker build -f ./Dockerfile-Minimal -t jupyterimages.azurecr.io/minimal:latest .
docker push jupyterimages.azurecr.io/minimal