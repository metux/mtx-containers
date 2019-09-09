#!/bin/sh

. /etc/profile

cd "$CWD"

exec /usr/bin/chromium --disable-namespace-sandbox "$@"
