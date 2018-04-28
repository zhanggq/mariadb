#!/bin/bash

IMAGE=mariadb.base:v10.1

echo Building $IMAGE
docker build -f Dockerfile -t $IMAGE ./
