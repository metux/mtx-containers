FROM debian:buster-slim

ADD files/prevent-systemd /etc/apt/preferences.d/
ADD files/run.sh          /
ADD files/install.sh      /

RUN /install.sh

ENTRYPOINT ["/run.sh"]
