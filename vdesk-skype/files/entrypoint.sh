#!/bin/bash

. /etc/profile

cd $CWD

SKYPE_PATH="/usr/share/skypeforlinux/skypeforlinux"
SKYPE_LOGS="$HOME/.config/skypeforlinux/logs"

mkdir -p $SKYPE_LOGS

#$SKYPE_PATH --executed-from="$(pwd)" --pid=$$ "$@" > "$SKYPE_LOGS/skype-startup.log" 2>&1 &
$SKYPE_PATH -- --executed-from="$(pwd)" --pid=$$ "$@"
