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

tag="py36-spark246-hadoop27-jdk8"
docker build \
--build-arg BASE_CONTAINER=dkamotsky/scipy-notebook:py36 \
--build-arg spark_version=2.4.6 \
--build-arg hadoop_version=2.7 \
--build-arg py4j_version="0.10.7" \
--build-arg spark_checksum="3A9F401EDA9B5749CDAFD246B1D14219229C26387017791C345A23A65782FB8B25A302BF4AC1ED7C16A1FE83108E94E55DAD9639A51C751D81C8C0534A4A9641" \
--tag dkamotsky/pyspark-notebook:${tag} --no-cache pyspark-notebook
docker build --build-arg BASE_CONTAINER=dkamotsky/pyspark-notebook:${tag} --tag dkamotsky/all-spark-notebook:${tag} --no-cache all-spark-notebook
docker push dkamotsky/all-spark-notebook:${tag}
