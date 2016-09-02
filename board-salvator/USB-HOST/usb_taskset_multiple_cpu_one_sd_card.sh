#!/bin/bash
# usb device driver autotest shell-script

set -e
#set -x

if [ $# -lt 1 ]; then
    echo "usage : $(basename $0) SRC_DIR"
    exit 1
fi

SRC_DIR="$1"

echo "Run taskset cpu"

i=10

if [ "$CPU_NUMBER" -gt 1 ];then

	CPU_NUM=0
	while [ "$CPU_NUM" -lt "$(($CPU_NUMBER - 1))" ]
	do
		taskset -c $CPU_NUM $(dirname $0)/usb_smp_read_write_copy_one.sh $RAM_DIR $SRC_DIR $(($i+10)) &
	    i=$(($i+10))
	    CPU_NUM=$(($CPU_NUM+1))
	done

	taskset -c $(($CPU_NUMBER - 1)) $(dirname $0)/usb_smp_read_write_copy_one.sh $RAM_DIR $SRC_DIR 10

fi