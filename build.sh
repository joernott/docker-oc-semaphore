#!/bin/bash
set -e
set -x
curl -sSo src/tmp/install/functions.sh https://raw.githubusercontent.com/joernott/docker-oc-install-library/master/install_functions.sh
source src/tmp/install/functions.sh

patch_dockerfile
git clone https://github.com/joernott/semaphore.git
cd semaphore
# Workaround while my changes are not back in master
git checkout feature/both_vaults
SEMAPHORE_COMMIT=$(git rev-parse HEAD)
FILES=$(find . -iname "*.go")
for FILE in ${FILES}; do
    sed -i ${FILE} -e 's|github.com/ansible-semaphore/semaphore|github.com/joernott/semaphore|g'
done
# End workaround
./make.sh
cd ..
if [ ! -d "src/${APP_HOME}" ]; then
    mkdir -p "src/${APP_HOME}"
fi
cp semaphore/cli/semaphore_linux_amd64 "src/${APP_HOME}/semaphore"
chmod a+x src/${APP_HOME}/semaphore
sed -i Dockerfile -e "s|SEMAPHORE_COMMIT=.*|SEMAPHORE_COMMIT=${SEMAPHORE_COMMIT} \\|"

docker build -t registry.ott-consult.de/oc/semaphore:latest .
docker push registry.ott-consult.de/oc/semaphore:latest
