#!/bin/bash

. /etc/profile

cd "$CWD"

exec /usr/games/freeciv-gtk3 "$@"
