#!/bin/sh
# usb device driver autotest shell-script

set -a
#set -x

echo "\n*********************READ SPEED USB3.0 TEST********************\n"

$(dirname $0)/usb_read_speed.sh $USB3_DIR

echo "\n***************************************************************\n"