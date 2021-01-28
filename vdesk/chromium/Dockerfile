#FROM metux/devuan-ascii-micro-amd64
#FROM debian:testing-slim
FROM debian:buster-slim

ARG driver_packages=libgl1-mesa-dri

ADD files/install.sh      /
ADD files/run.sh          /
ADD autogen/debinstall.sh /

RUN /install.sh

ENTRYPOINT ["/run.sh"]
