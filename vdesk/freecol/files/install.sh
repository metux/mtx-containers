#!/bin/bash

. /debinstall.sh

# fixup for broken java package
mkdir -p /usr/share/man/man1/

base_install apt-utils freecol
clean_all
