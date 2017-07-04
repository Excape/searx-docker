# Dockerfile for filtron, based on https://github.com/dasmaeh/docker-filtron/

FROM golang:alpine
MAINTAINER Robin Suter <robin@robinsuter.ch>

ENV APP_PORT 8888
ENV RULES_FILE /etc/filtron/rules.json

# install git
RUN apk add --no-cache git

# install filtron
RUN go get github.com/asciimoo/filtron
RUN mkdir /etc/filtron

EXPOSE 4004 4005

ADD entrypoint.sh /entrypoint.sh
ADD rules.json /etc/filtron/rules.json

ENTRYPOINT ["/entrypoint.sh"]
