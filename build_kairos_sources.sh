#!/bin/bash

set -e
set -u

BASE_DIR=$(readlink -m $(dirname $0))
cd $BASE_DIR


kairos_sources_dir=$BASE_DIR/kairos_sources
echo "KairosDB sources will be available in the kairos_source directory located at : $kairos_sources_dir"

mkdir -p $kairos_sources_dir

echo "Building docker image"
docker build . -t kairos_installation

echo "Running docker container and copying KairosDB sources"
docker run -d --name build_kairos --rm  kairos_installation && \
docker cp build_kairos:/root/kairosdb/build/.  $kairos_sources_dir/. 

exit 0 
