#!/bin/sh
# sata device driver autotest shell-script

set -a
#set -x

echo "\n**************************SATA TEST BLOCK OVER SEEK*********************\n"

fdisk -l ${SATA_DEVICE}1 > $LOGFILE

fil=$LOGFILE

if [ -f $fil ]; then

#get sector device 
seek=`grep Disk $fil | tail -1 | cut -d ' '  -f5`
xbs=`grep Units $fil | tail -1 | cut -d ' '  -f8`
fi

seek=`expr $seek / $xbs`
seek_over=$(($seek + 1))

dd if=/dev/zero of=${SATA_DEVICE}1 bs=$xbs count=1 seek=${seek_over}

if [ "$?" = "0" ]; then
	eval $FAIL_MEG
else
	eval $PASS_MEG
fi	

rm -rf $LOGFILE

echo "\n************************************************************************\n"
