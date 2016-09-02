#!/bin/sh
# gpio device driver autotest shell-script

set -e
#set -x

echo "\n************************CHECK GPIO SYSFS NGPIO TEST*********************\n"

find /sys/class/gpio/gpiochip*/* | grep ngpio$ | xargs cat > $LOGFILE

for ngpio in $NGPIO
do
	if ! cat $LOGFILE | grep $ngpio;then
		echo "\n ${ngpio} not found \n"
		eval $FAIL_MEG
		exit 1
	fi	
done

eval $PASS_MEG

rm -rf $LOGFILE

echo "\n************************************************************************\n"