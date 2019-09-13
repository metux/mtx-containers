#!/bin/bash

. /etc/profile

if [ "$LOCAL_GROUP_NAME" ] && [ "$LOCAL_GROUP_ID" ] && [ "$LOCAL_USER_NAME" ] && [ "$LOCAL_USER_ID" ]; then
    groupadd "$LOCAL_GROUP_NAME" -g "$LOCAL_GROUP_ID"
    useradd "$LOCAL_USER_NAME" -u "$LOCAL_USER_ID" -g "$LOCAL_GROUP_ID"
fi

cd "$CWD"

while true ; do sleep 60 ; done
