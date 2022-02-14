FROM ubuntu:20.04

ARG input_dir

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Detroit
RUN \
    apt-get update -qq && \
    apt-get install -qq -y tzdata

COPY . /repo
RUN cp -r "/repo/${input_dir}" /input

COPY observiq-collector/dist/collector_linux_amd64 /collector
COPY plugins /plugins
RUN mkdir /storage /output

ENTRYPOINT [ "/collector", "--config", "/input/config/collector.yaml" ]