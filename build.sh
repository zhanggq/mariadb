#!/bin/bash

IMAGE=mariadb:v10.1

echo Building $IMAGE
docker build -f Dockerfile.amaze -t $IMAGE ./
