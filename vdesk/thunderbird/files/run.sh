#!/bin/bash

. /etc/profile

cd "$CWD"

exec /usr/bin/thunderbird "$@"
