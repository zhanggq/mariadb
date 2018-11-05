#!/bin/bash

name="mariadb-ga"
tag="10.1.32"
dockerfile="Dockerfile"

build_img(){
    echo -e "[Start to build image]\nname:$name\ntag:$tag"
    docker build -t "$name:$tag" . < $dockerfile
}
build_img
