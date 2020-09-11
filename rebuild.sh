#!/bin/bash

docker login

docker build --tag dkamotsky/docker-stacks/pyspark-notebook:spark300-hadoop27 --no-cache pyspark-notebook
docker build --build-arg BASE_CONTAINER=dkamotsky/docker-stacks/pyspark-notebook:spark300-hadoop27 --tag dkamotsky/docker-stacks/all-spark-notebook:spark300-hadoop27 --no-cache all-spark-notebook

docker push dkamotsky/docker-stacks/pyspark-notebook:spark300-hadoop27
docker push dkamotsky/docker-stacks/all-spark-notebook:spark300-hadoop27
