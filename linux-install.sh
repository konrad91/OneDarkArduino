#!/bin/bash
# Author:       sickcodes
# Repo:         https://github.com/konrad91/OneDarkArduino
# Contact:      https://twitter.com/sickcodes
# Copyright:    sickcodes (C) 2021
# License:      GPLv3+

set -e

IDE_PATH=/usr/share/arduino/lib

if [ "$(pgrep arduino)" ]; then
    echo "Please close Arduino IDE first."
    exit 1
fi

if ! [ "$(stat ./theme)" ]; then
    echo "No theme folder found in your current directory."
    echo "Download again from Github, and run this from inside that directory."
    exit 1
fi

echo "Moving OLD theme folder to ${IDE_PATH}/theme.bak"
cp -r "${IDE_PATH}/theme" "${IDE_PATH}/theme.bak"

echo "Moving NEW theme folder to ${IDE_PATH}/theme"
cp -r ./theme "${IDE_PATH}/theme"

exit 0