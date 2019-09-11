#!/bin/bash

set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update

apt-get upgrade -y

apt-get install --no-install-recommends -y \
    locales \
    pkg-config \
    g++ \
    libpango1.0-dev \
    autoconf2.13 \
    libgtk-3-0 \
    gir1.2-gtk-3.0 \
    libgtk-3-dev \
    libgtk2.0-dev \
    git \
    mc \
    tig \
    python \
    unzip \
    zip \
    make \
    libgconf2-dev \
    libdbus-glib-1-dev \
    yasm \
    libpulse-dev \
    libxt-dev \
    libhunspell-dev \
    less \
    libasound2-dev \
    libsqlite3-dev \
    libevent-dev \
    autoconf

apt-get autoremove -y

apt-get clean

locale-gen
