#FROM debian:buster-slim
FROM dyne/devuan:ceres

LABEL distro="debian/buster" \
      version="2.10.8" \
      maintainer="info@metux.net"

ADD files/prevent-systemd /etc/apt/preferences.d/
ADD files/locale.gen      /etc
ADD files/install.sh      /
ADD files/run.sh          /

RUN /install.sh

ENTRYPOINT ["/run.sh"]
