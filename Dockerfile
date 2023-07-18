## Base image to use
FROM ghcr.io/linuxserver/baseimage-alpine:3.13

## Maintainer info
MAINTAINER Lennong <https://github.com/Lennong>

# set python to use utf-8 rather than ascii.
ENV PYTHONIOENCODING="UTF-8"

## Update base image and install prerequisites
RUN apk add --update git python2 && \
  rm -rf /var/cache/apk/*

## Install Couchpotato
RUN cd /opt && \
  git clone https://github.com/Lennong/couchpotato-old.git

## Expose port
EXPOSE 5050

## Set working directory
WORKDIR /opt

## Run Couchpotato
ENTRYPOINT ["python", "CouchPotatoServer/CouchPotato.py"]
