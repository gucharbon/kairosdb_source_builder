#!/bin/bash

set -e
set -u

BASE_DIR=$(readlink -m $(dirname $0))
echo "Moving to project root directory : ${BASE_DIR}"
cd $BASE_DIR


kairos_sources_dir=$BASE_DIR/kairos_sources
echo "KairosDB sources will be available in the dist_volume located at : $kairos_sources_dir"

mkdir -p $kairos_sources_dir

docker build . -t kairos_installation

docker run -d --name build_kairos --rm  kairos_installation && \
docker cp build_kairos:/root/kairosdb/build/.  $kairos_sources_dir/. 



exit 0 
