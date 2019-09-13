#!/bin/bash

set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update

apt-get upgrade -y

#apt-get autoremove -y

#apt-get clean

apt-get install -y \
    libfontconfig1 \
    libxtst6 \
    libxrender1 \
    libxrandr2 \
    libxi6 \
    libxfixes3 \
    libxext6 \
    libxdamage1 \
    libxcursor1 \
    libxcomposite1 \
    libxcb1 \
    libxcb-dri3-0 \
    libgtk-3-0 \
    libexpat1 \
    libcups2 \
    libcairo2 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libasound2 \
    libdrm2 \
    libgbm1 \
    libnss3 \
    libx11-xcb1 \
    gnupg \
    locales \
    strace \
    libsecret-1-0

dpkg -i /teams_*.deb

locale-gen

CLEAN_LOCALES="ar ca da el es-ES fi gd hr it ko nb pl pt-PT sk sq tr zh-CN
               bg cs fa fr gl gl hu ja lt nl pt-BR ru sl sv vi zh-TW"

#for i in $CLEAN_LOCALES ; do
#    rm -Rf /usr/share/xul-ext/enigmail/chrome/locale/$i
#done

echo rm -Rf /usr/share/doc \
       /usr/share/icons/Adwaita \
       /usr/lib/systemd \
       /usr/local \
       /usr/src \
       /usr/bin/appres \
       /usr/bin/dbus-cleanup-sockets \
       /usr/bin/dbus-uuidgen \
       /usr/bin/debconf-escape \
       /usr/bin/dbus-daemon \
       /usr/bin/deb-systemd-helper \
       /usr/bin/dbus-launch \
       /usr/bin/dbus-monitor \
       /usr/bin/dbus-run-session \
       /usr/bin/dbus-send \
       /usr/bin/dbus-update-activation-environment \
       /usr/bin/editres \
       /usr/bin/gtk-update-icon-cache \
       /usr/bin/kbxutil \
       /usr/bin/xdpyinfo \
       /usr/bin/xev \
       /usr/bin/xfontsel \
       /usr/bin/xlsatoms \
       /usr/bin/xlsfonts \
       /usr/bin/xprop \
       /usr/bin/xwininfo \
       /usr/bin/xdriinfo \
       /usr/bin/xfd \
       /usr/bin/xkill \
       /usr/bin/xlsclients \
       /usr/bin/xmessage \
       /usr/bin/xvinfo \
       /var/lib/systemd \
       /var/lib/dpkg/*-old \
       /var/lib/apt/lists \
       /var/lib/apt/mirrors \
       /var/lib/apt/periodic \
       /var/mail \
       /var/opt \
       /var/spool \
       /var/backups \
       /var/cache/apt \
       /var/cache/fontconfig/* \
       /var/local \
       /var/opt \
       /boot \
       /media \
       /opt \
       /mnt \
       /root \
       /srv \
       /lib/systemd \
       /usr/share/info \
       /usr/share/man \
       /usr/share/pkgconfig \
       /usr/share/common-licenses \
       /usr/share/polkit-1 \
       /usr/share/menu \
       /usr/share/X11/xkb \
       /usr/share/applications \
       /usr/share/perl5/Debconf \
       /usr/share/bash-completion \
       /usr/share/bug \
       /usr/share/X11/locale/el_GR.UTF-8 \
       /usr/share/libthai \
       /usr/share/lintian
