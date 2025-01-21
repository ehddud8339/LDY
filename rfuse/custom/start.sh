#!/bin/bash

# RFUSE

set -euo pipefail

storage=$1
#scrtype=$2
scheduler=$2
NUM_CORE=("0-11")
dev="/dev/nvme0n1p3"
#NUM_CORE=("none")

echo "${scheduler}"
sleep 1
sudo ./setting.sh ${scheduler}
sleep 1

echo 3 > /proc/sys/vm/drop_caches

if [ ${storage} == ramdisk ]; then
    sudo mkdir -p /mnt/ramdisk /mnt/test
    sudo mount -t tmpfs -o size=50G tmpfs /mnt/ramdisk
    pushd ../../filesystems/stackfs
    make clean
    make
    ./StackFS_ll -r /mnt/ramdisk /mnt/test &
    popd

    sudo sync

elif [ ${storage} == ssd ]; then
    set +euo pipefail
    # sudo mkdir -p /mnt/RFUSE_EXT4 /mnt/test
	
    sudo umount /mnt/RFUSE_EXT4
    sleep 1
    sudo umount /mnt/test
    sleep 1
    echo "Mount ext4..."
    sudo mkfs.ext4 -F -E lazy_itable_init=0,lazy_journal_init=0 ${dev}
    sudo mount ${dev} /mnt/RFUSE_EXT4

    echo "Mount rfuse-stackfs..."
    pushd ../../filesystems/stackfs
    make clean
    sleep 1
    make
    sleep 1
    ./StackFS_ll -r /mnt/RFUSE_EXT4 /mnt/test &
    popd
    
    sudo sync
else
    echo "Wrong filesystem"
    exit 0
fi
echo -e "\n\n\nWating for 60 sec after sync ... \n\n\n"
sleep 60
echo -e "\n\n\nWating for 10sec after drop cache... \n\n\n"
echo 3 > /proc/sys/vm/drop_caches
sleep 10
