FROM debian:testing-slim

#LABEL distro="debian/buster" \
#      version="2.10.8" \
#      maintainer="info@metux.net"

ADD autogen/prevent-systemd /etc/apt/preferences.d/
ADD autogen/locale.gen      /etc
ADD files/install.sh      /
ADD files/run.sh          /
ADD autogen/debinstall.sh /

RUN /install.sh

ENTRYPOINT ["/run.sh"]
