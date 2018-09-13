#!/bin/bash

echo "Creating debian base image: "
echo "$*"

DISTRO="$(basename $1)"
ARCH="$(basename $2)"
NAME="$(basename $3)"
WORKDIR="/tmp/debootstrap/$NAME"
ARCHIVE="$CWD/$NAME.tar.bz2"

if [ ! "$3" ]; then
    echo "$0 <distro> <arch> <archive-name>" >&2
    exit 1
fi

case "$DISTRO" in
    buster|stretch)
        MIRROR="http://ftp.de.debian.org/debian/"
    ;;
    *)
        MIRROR="http://pkgmaster.devuan.org/merged/"
    ;;
esac

echo "DISTRO:  $DISTRO"
echo "ARCH:    $ARCH"
echo "NAME:    $NAME"
echo "WORKDIR: $WORKDIR"
echo "ARCHIVE: $ARCHIVE"
echo "CWD:     $CWD"
echo "mirror:  $MIRROR"

mkdir -p $WORKDIR
debootstrap --arch "$ARCH" "$DISTRO" "$WORKDIR" "$MIRROR"
