#!/bin/bash
# usb device driver autotest shell-script

set -e
#set -x

echo "\n************************WRITE DATA FROM RAM TO USB2.0*******************\n"

$(dirname $0)/usb_copy_data.sh $RAM_DIR $USB2_CH2_DIR 100

echo "\n************************************************************************\n"