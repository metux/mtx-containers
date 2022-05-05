#FROM debian:buster-slim
FROM ubuntu:focal

ADD files/prevent-systemd /etc/apt/preferences.d/
ADD files/locale.gen      /etc
ADD files/install.sh      /
ADD files/run.sh          /

RUN apt-get update && apt-get install -y curl sudo ca-certificates gpg

RUN curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
ADD files/teams.list     /etc/apt/sources.list.d/

RUN apt-get install -y libgtk-3-0
RUN apt-get update && apt-get upgrade -y && apt-get install -y teams

RUN apt-get install -y libsecret-1-0
RUN apt-get install -y wget
RUN apt-get install -y alsa-utils

RUN apt-get install -y pulseaudio
RUN apt-get install -y strace

ADD files/pulse-client.conf /etc/pulse/client.conf

ENTRYPOINT ["/run.sh"]
