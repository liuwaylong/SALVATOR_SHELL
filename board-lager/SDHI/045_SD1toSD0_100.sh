#!/bin/bash

echo "copy file 100 MB from SD1 to SD0"

$(dirname $0)/../helper/write_helper.sh "sd0" -src "sd1" -bcnt 100