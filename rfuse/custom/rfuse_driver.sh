#!/bin/bash

# RFUSE

set -euo pipefail

storage=$1
scrtype=$2
scheduler=$3
#numberinfo=$4
#NUM_CORE=("0" "0-1" "0-3" "0-7" "0-15" "0-31")
NUM_CORE=("0-39")
dev="/dev/nvme0n1p1"
#NUM_CORE=("none")

interrupt_handler() {
	if [ ${storage} == ramdisk ]; then 
		set +euo pipefail
		sudo rm -rf /mnt/ramdisk/* /mnt/test/*
		sudo umount /mnt/ramdisk /mnt/test
		sudo rm -r /mnt/ramdisk /mnt/test

		sudo sync
		set -euo pipefail
	elif [ ${storage} == ssd ]; then 
		set +euo pipefail
		sudo rm -rf /mnt/RFUSE_EXT4/* /mnt/test/*
		sudo umount /mnt/RFUSE_EXT4 /mnt/test
		sudo rm -r /mnt/RFUSE_EXT4 /mnt/test

		sudo sync
	else
		echo "Wrong"
	fi
	
}
trap 'interrupt_handler' SIGINT


for numcore in "${NUM_CORE[@]}"
do
	echo "${numcore}"
	echo "${scheduler}"
	sleep 1
	sudo ./setting_none.sh ${scheduler}
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
		sudo mkdir -p /mnt/RFUSE_EXT4 /mnt/test

		echo "Mount ext4..."
		sudo mkfs.ext4 -F -E lazy_itable_init=0,lazy_journal_init=0 ${dev}
		sudo mount ${dev} /mnt/RFUSE_EXT4

		echo "Mount rfuse-stackfs..."
		pushd ../../filesystems/stackfs
		make clean
		make
		./StackFS_ll -r /mnt/RFUSE_EXT4 /mnt/test &
		popd

		sudo sync
	else
		echo "Wrong filesystem"
		exit 0
	fi
	sleep 5
	echo -e "\n\n\nWating for 60 sec after sync ... \n\n\n"
	sleep 60
	echo -e "\n\n\nWating for 10sec after drop cache... \n\n\n"
	echo 3 > /proc/sys/vm/drop_caches
	sleep 10
	
	#Log dmesg - 1 _ start *[Do not use this for YCSB]
	#bash dmesg_log.sh ${scrtype} ${scheduler} &
	#bg_pid=$!
	#Log dmesg - 1 _ end
	
	#Fio _ start
	#sudo fio script/${scrtype}.fio
	#sudo fio script/${scrtype}.fio | tee ./cpu_log/${scheduler}_${scrtype}.txt
	#sudo fio script/${scrtype}.fio | tee ./cpu_log/${scheduler}_${numberinfo}_${scrtype}.txt
	#Fio _ end
	
	#Varmail _ start
	#pushd ../filebench/src/
	#sudo ./starting.sh
	#popd
	#sleep 1
	#sudo filebench -f ./script/{scrtype}.f
	#sudo filebench -f ./script/varmail.f | tee ./log/${scheduler}_${scrtype}.txt
	#sudo filebench -f ./script/varmail.f | tee ./log/${scheduler}_${numberinfo}_${scrtype}.txt
	#Varmail _ end
	
	#YCSB _ start
	#pushd ../../../YCSB
	#sudo ./load_workload.sh ${scrtype} 10000000 10000000 ${scheduler}_${scrtype}
	#echo -e "\n\n\nWaiting for 60 sec after YCSB load files sync... \n\n\n"
	#sleep 60
	
	##YCSB Log dmesg -1 _ start
	#bash /home/rfuse_test/rfuse/bench/custom/dmesg_log.sh ${scrtype} ${scheduler} &
	#bg_pid=$!
	##YCSB Log dmesg -1 _ end

	#sudo ./run_workload.sh ${scrtype} 10000000 10000000 ${scheduler}_${scrtype}
	
	##YCSB Log dmesg -2 _ start
	#sleep 3
	#sudo kill -9 $bg_pid
	##YCSB Log dmesg -2 _end

	#popd
	#YCSB _ end

	#Log dmesg - 2 _ start *[Do not use this for YCSB]
	#sleep 3
	#sudo kill -9 $bg_pid
	#Log dmesg - 2 _ end

	#Perf _ start
	#sudo perf timechart record -g -- fio script/4KB-rand-write-origin.fio
	#sudo perf record -F 1000 -a -g -- fio script/4KB-rand-write-origin.fio
	#sudo perf stat -o ./mem/perf_${name}.stat -- fio script/4KB-rand-write-origin.fio
	#sudo perf record -F 1000 -a -g -o ./mem/${name}.data -- fio script/4KB-rand-write-origin.fio
	#sudo perf record -e 'sched:sched_switch,sched:sched_wakeup,sched:sched_migrate_task,irq:irq_handler_entry,irq:irq_handler_exit' -a -g -- fio script/4KB-rand-write-origin.fio
	#sudo perf sched record -g -- fio script/4KB-rand-write-origin.fio 
	#Perf _ end

	echo -e "\n\n\nDone. Wating for 30 sec...\n\n\n"
	sleep 30	
	
	
	if [ ${storage} == ramdisk ]; then 
		set +euo pipefail
		sudo rm -rf /mnt/ramdisk/* /mnt/test/*
		sleep 1
		sudo umount /mnt/ramdisk /mnt/test
		sleep 1
		sudo rm -r /mnt/ramdisk /mnt/test
		sleep 1

		sudo sync
		set -euo pipefail
	elif [ ${storage} == ssd ]; then 
		set +euo pipefail
		sudo rm -rf /mnt/RFUSE_EXT4/* /mnt/test/*
		sudo umount /mnt/RFUSE_EXT4 /mnt/test
		sudo rm -r /mnt/RFUSE_EXT4 /mnt/test

		sudo sync
	else
		echo "Wrong"
	fi

	echo -e "\n\n\nClear all files. Wating for 60 sec...\n\n\n"
	sleep 60
done
