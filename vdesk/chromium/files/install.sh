#!/bin/bash

. /debinstall.sh

base_install libgtk-3-0 libgl1-mesa-dri chromium chromium-sandbox
clean_all
