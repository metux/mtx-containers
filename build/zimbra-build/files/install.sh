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
    openjdk-11-jdk \
    ant \
    ant-optional \
    ruby \
    maven \
    build-essential \
    wget

apt-get autoremove -y

apt-get clean

locale-gen
