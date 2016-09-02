#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

echo "\n*************Ctr_Z DURING TRANFER DATA FROM BOARD TO HOST PC**********\n"

eval $MOUNT_RAM

for size in "350"; do

	echo "prepare data for test"

	if ! [ -f "$(dirname $0)/data/file-${size}mb" ]; then
		dd if=/dev/urandom of=/tmp/file-${size}mb bs=1M count=${size}
	else
		cp $(dirname $0)/data/file-${size}mb /tmp
		sync
	fi

	if [ -f "/tmp/file-${size}mb" ];then
		echo "prepare data successfully"
	else
		echo "prepare data not successfully"
		eval $FAIL_MEG
		break;	
	fi

	echo "tranfer file ${size}MB"
	$(dirname $0)/ftp_get_pc_to_board_data.sh $size & sleep 10;

	$(dirname $0)/../common/ctr_z.sh "ftp -inv"

done

eval $UNMOUNT_RAM

echo "\n**********************************************************************\n"