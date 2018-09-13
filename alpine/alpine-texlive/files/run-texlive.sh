#!/bin/bash

. /etc/profile

echo "=== CWD=$CWD"
echo "=== calling: $*"

cd $CWD
exec $*
