FROM registry.ott-consult.de/oc/base:latest
LABEL MAINTAINER="joern.ott@ott-consult.de"

ENV APP_USER=semaphore \
    APP_UID=2006 \
    APP_GROUP=semaphore \
    APP_GID=2006 \
    APP_HOME=/semaphore \
    SEMAPHORE_OPTIONS="" \
    GIT_COMMIT=x \
    SEMAPHORE_COMMIT=x \
    IMAGE_HISTORY=""

COPY src /

RUN /tmp/install/oc-semaphore.sh

EXPOSE 3000

