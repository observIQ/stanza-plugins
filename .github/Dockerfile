FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
RUN \
    apt-get update -qq && \
    apt-get install -qq -y tzdata

COPY observiq-collector/dist/collector_linux_amd64 /collector
COPY plugins /plugins
RUN mkdir /storage

ENTRYPOINT [ "/collector" ]