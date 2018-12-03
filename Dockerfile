FROM alpine:3.8

MAINTAINER Gigitsu <gigitsu.23@gmail.com>

ENV KUBECTL_VERSION=v1.12.3

RUN apk update  && apk add --no-cache curl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl
RUN rm /var/cache/apk/*
RUN mkdir -p ${HOME}/.kube

CMD ["kubectl", "help"]