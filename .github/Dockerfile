FROM ubuntu:20.04

ARG input_dir

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
RUN \
    apt-get update -qq && \
    apt-get install -qq -y tzdata

COPY ${INPUT_DIR} /input
COPY observiq-collector/dist/collector_linux_amd64 /collector
COPY plugins /plugins
RUN mkdir /storage /output

ENTRYPOINT [ "/collector", "--config", "/input/config/collector.yaml" ]