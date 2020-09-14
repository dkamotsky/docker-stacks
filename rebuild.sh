#!/bin/bash

tag="py36"
docker build --build-arg PYTHON_VERSION=3.6 --tag dkamotsky/base-notebook:${tag} --no-cache base-notebook
docker build --build-arg BASE_CONTAINER=dkamotsky/base-notebook:${tag} --tag dkamotsky/minimal-notebook:${tag} --no-cache minimal-notebook
docker build --build-arg BASE_CONTAINER=dkamotsky/minimal-notebook:${tag} --tag dkamotsky/scipy-notebook:${tag} --no-cache scipy-notebook

tag="py37"
docker build --build-arg PYTHON_VERSION=3.7 --tag dkamotsky/base-notebook:${tag} --no-cache base-notebook
docker build --build-arg BASE_CONTAINER=dkamotsky/base-notebook:${tag} --tag dkamotsky/minimal-notebook:${tag} --no-cache minimal-notebook
docker build --build-arg BASE_CONTAINER=dkamotsky/minimal-notebook:${tag} --tag dkamotsky/scipy-notebook:${tag} --no-cache scipy-notebook

tag="py36-spark300-hadoop27-hive12-jdk8"
docker build --build-arg BASE_CONTAINER=dkamotsky/scipy-notebook:py36 --tag dkamotsky/pyspark-notebook:${tag} --no-cache pyspark-notebook
docker build --build-arg BASE_CONTAINER=dkamotsky/pyspark-notebook:${tag} --tag dkamotsky/all-spark-notebook:${tag} --no-cache all-spark-notebook
docker push dkamotsky/all-spark-notebook:${tag}

tag="py37-spark300-hadoop27-hive12-jdk8"
docker build --build-arg BASE_CONTAINER=dkamotsky/scipy-notebook:py37 --tag dkamotsky/pyspark-notebook:${tag} --no-cache pyspark-notebook
docker build --build-arg BASE_CONTAINER=dkamotsky/pyspark-notebook:${tag} --tag dkamotsky/all-spark-notebook:${tag} --no-cache all-spark-notebook
docker push dkamotsky/all-spark-notebook:${tag}
