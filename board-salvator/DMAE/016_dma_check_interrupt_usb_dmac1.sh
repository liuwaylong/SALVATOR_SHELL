#!/bin/sh
# dma device driver autotest shell-script

set -e
#set -x

echo "\n*********************CHECK INTERRUPT AFTER START THE BOARD**************\n"

exec $(dirname $0)/../common/proc-interrupts-multiple.sh "$USBDMAC1_INTERRUPT"

echo "\n************************************************************************\n"