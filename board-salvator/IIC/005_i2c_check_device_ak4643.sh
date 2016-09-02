#!/bin/sh
# i2c device driver autotest shell-script

set -e
#set -x

echo "\n*********************I2C CHECK DEVICE CONNECT TEST**********************\n"

if $(dirname $0)/device_connect_check.sh "$AK4643_DEVICE" "$AK4643_NAME" ;then
	eval $PASS_MEG
else
	eval $FAIL_MEG	
fi

echo "\n************************************************************************\n"