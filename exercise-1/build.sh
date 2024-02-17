#!/bin/bash

app="$1"
version="$2"
tag="docker.io/alayahamza/$app:$version"

docker build -t "$tag" --build-arg="app=$app" --build-arg="version=$version" .
#docker push "$tag"
