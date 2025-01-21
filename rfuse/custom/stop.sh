#!/bin/bash

target="StackFS_ll"

target_pid=$(pgrep -f $target)

if [ -z "$target_pid" ]; then
	echo "$target is not running"
else
	echo "$target is running"

	sudo kill -9 $target_pid
	sleep 3

	if [ $? -eq 0 ]; then
		echo "$target has been terminated"

		sudo umount -l /mnt/RFUSE_EXT4 /mnt/test
	#	sudo rm -rf /mnt/RFUSE_EXT4/* /mnt/test/*
	#	sudo rm -r /mnt/RFUSE_EXT4 /mnt/test
	else
		echo "Failed to terminate $target"
	fi
fi
