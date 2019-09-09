#!/bin/bash

. /etc/profile

# dbus-uuidgen --ensure

cd "$CWD"

exec /usr/bin/gimp "$@"
