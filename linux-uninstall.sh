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

if ! [ "$(stat ${IDE_PATH}/theme.bak)" ]; then
    echo "No old theme folder found in your Arduino libraries."
    echo "Simply reinstalling Arduino (overwrite) will fix this."
    exit 1
fi

echo "Removing the installed theme folder..."
rm -rf "${IDE_PATH}/theme"

echo "Moving OLD theme folder back ${IDE_PATH}/theme"
mv "${IDE_PATH}/theme.bak" "${IDE_PATH}/theme" 

exit 0