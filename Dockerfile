FROM registry.ott-consult.de/oc/base:latest
LABEL MAINTAINER="joern.ott@ott-consult.de"

ENV APP_USER=semaphore \
    APP_UID=2006 \
    APP_GROUP=semaphore \
    APP_GID=2006 \
    APP_HOME=/semaphore \
    SEMAPHORE_OPTIONS="" \
    GIT_COMMIT=x \
    IMAGE_HISTORY=" « jenkins-docker-oc-base-29 « centos/7 declare -x OLDPWD declare -x PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin declare -x PWD=/ declare -x SHLVL=1"

COPY src /

RUN /tmp/install/oc-semaphore.sh
ENTRYPOINT /entrypoint

EXPOSE 3000

