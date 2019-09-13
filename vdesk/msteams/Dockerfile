FROM debian:buster-slim

LABEL distro="debian/buster" \
      version="60.8.0" \
      maintainer="info@metux.net"

ADD files/prevent-systemd /etc/apt/preferences.d/
ADD files/locale.gen      /etc
ADD files/install.sh      /
ADD files/run.sh          /
ADD files/teams*.deb      /

RUN /install.sh

ENTRYPOINT ["/run.sh"]
