#!/bin/bash

set -e

export DEBIAN_FRONTEND=noninteractive

mkdir -p /usr/share/man/man1/

apt-get update

apt-get upgrade -y

apt-get install --no-install-recommends -y \
    locales \
    pkg-config \
    g++ \
    autoconf2.13 \
    git \
    mc \
    tig \
    python \
    unzip \
    zip \
    make \
    less \
    autoconf \
    openjdk-8-jdk \
    ant \
    ant-optional \
    ruby \
    maven \
    build-essential \
    wget \
    lsb-release \
    fakeroot \
    debhelper \
    rsync

(echo DISTRIB_ID=`lsb_release -si`; echo DISTRIB_CODENAME=`lsb_release -sc`) > /etc/lsb-release

apt-get autoremove -y

apt-get clean

locale-gen
