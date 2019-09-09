FROM metux/devuan-ascii-micro-amd64

ARG driver_packages=libgl1-mesa-dri

ADD files/install.sh      /
ADD files/run.sh          /

RUN /install.sh

ENTRYPOINT ["/run.sh"]
