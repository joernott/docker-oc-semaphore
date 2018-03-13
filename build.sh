#!/bin/bash
set -e
set -x
curl -sSo src/tmp/install/functions.sh https://raw.githubusercontent.com/joernott/docker-oc-install-library/master/install_functions.sh
source src/tmp/install/functions.sh

patch_dockerfile
if [ ! -d ${PWD}/src/semaphore ]; then
    mkdir -p ${PWD}/src/semaphore
fi
docker run -e  SEMAPHORE_BRANCH=${SEMAPHORE_BRANCH} \
           -e OUTPUT_USER=${USER} \
           -e OUTPUT_GROUP=users \
           -v ${PWD}/src/semaphore:/output \
           registry.ott-consult.de/oc/semaphore-build
docker build -t registry.ott-consult.de/oc/semaphore:latest .
docker push registry.ott-consult.de/oc/semaphore:latest
