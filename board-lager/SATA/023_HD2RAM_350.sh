#!/bin/bash

echo "copy file 350 MB from SATA device to RAM"

$(dirname $0)/../helper/write_helper.sh "/mnt/hd"  -read -bcnt 350