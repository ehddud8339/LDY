#!/bin/bash

set +euo pipefail
TARGET="StackFS_ll"
PID=$(pgrep -f $TARGET)
sudo kill -9 $PID

sudo umount -l /mnt/RFUSE_EXT4 /mnt/test
sudo rm -rf /mnt/RFUSE_EXT4/* /mnt/test/*
sudo rm -r /mnt/RFUSE_EXT4 /mnt/test
sudo sync

echo 3 > /proc/sys/vm/drop_caches
