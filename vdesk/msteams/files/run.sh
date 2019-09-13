#!/bin/bash

. /etc/profile

echo "CWD=$CWD"
cd "$CWD"

#strace -f /usr/bin/teams "$@"
#echo "returned: $?"

SCRIPT=$(readlink -f "$0")
USR_DIRECTORY=$(readlink -f $(dirname $SCRIPT)/..)

TEAMS_PATH="/usr/share/teams/teams"
TEAMS_LOGS="$HOME/.config/Microsoft/Microsoft Teams/logs"

mkdir -p "$TEAMS_LOGS"

$TEAMS_PATH "$@" --disable-namespace-sandbox --disable-setuid-sandbox
echo "result: $?"
