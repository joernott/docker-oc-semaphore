# Docker image: CentOS 7 with semaphore
Running semaphore (ansible tower alternative) on CentOS 7.

This container provides semaphore listening on port 3000

## Usage:
```
docker run -d -p 3000:3000 \
    -v /data/semaphore/semaphore/jonfig.json:/semaphore/jonfig.json \
    registry.ott-consult.de/oc/semaphore:latest
```
