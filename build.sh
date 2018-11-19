#!/bin/bash

IMAGE=mariadb.amaze:v10.1

echo Building $IMAGE
docker build -f Dockerfile -t $IMAGE ./
