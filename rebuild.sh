#!/bin/bash

docker build --tag dkamotsky/pyspark-notebook:spark301-hadoop32 --no-cache pyspark-notebook
docker build --build-arg BASE_CONTAINER=dkamotsky/pyspark-notebook:spark301-hadoop32 --tag dkamotsky/all-spark-notebook:spark301-hadoop32 --no-cache all-spark-notebook

docker push dkamotsky/pyspark-notebook:spark301-hadoop32
docker push dkamotsky/all-spark-notebook:spark301-hadoop32
