#!/bin/bash

tag="spark300-hadoop27-hive12-jdk8"

docker build --tag dkamotsky/pyspark-notebook:${tag} --no-cache pyspark-notebook
docker build --build-arg BASE_CONTAINER=dkamotsky/pyspark-notebook:${tag} --tag dkamotsky/all-spark-notebook:${tag} --no-cache all-spark-notebook

docker push dkamotsky/pyspark-notebook:${tag}
docker push dkamotsky/all-spark-notebook:${tag}
