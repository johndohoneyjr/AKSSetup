#! /bin/bash
docker login jupyterimages.azurecr.io
# Build Images
docker build -f ./Dockerfile-Python -t jupyterimages.azurecr.io/datascience:latest .
docker build -f ./Dockerfile-Spark -t jupyterimages.azurecr.io/spark:latest .
docker build -f ./Dockerfile-tensorflow -t jupyterimages.azurecr.io/tensorflow:latest .
docker build -f ./Dockerfile-Minimal -t jupyterimages.azurecr.io/minimal:latest .
echo "Image Build Complete"
docker images


# Test Images
echo " "
echo "Authenticating to Synk..."
docker scan --login
echo " "
echo "Running Synk to scan container images"
docker scan jupyterimages.azurecr.io/minimal --file=Dockerfile-Minimal
docker scan jupyterimages.azurecr.io/spark --file=Dockerfile-Spark
docker scan jupyterimages.azurecr.io/datascience --file=Dockerfile-Python
docker scan jupyterimages.azurecr.io/tensorflow --file=Dockerfile-tensorflow

# Push Images
echo " "
echo "Pushing container images to registry"
docker push jupyterimages.azurecr.io/minimal
docker push jupyterimages.azurecr.io/tensorflow
docker push jupyterimages.azurecr.io/spark
docker push jupyterimages.azurecr.io/datascience