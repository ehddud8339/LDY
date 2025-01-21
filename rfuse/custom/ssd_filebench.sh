#!/bin/bash
#NUM=("1" "2" "3")
NUM=("1")
for num in "${NUM[@]}"
do
	echo "fileserver"
	#echo "round robin"
	#sudo ./rfuse_driver.sh ssd varmail rr ${num}
	echo "cpu id"
	sudo ./rfuse_driver.sh ssd fileserver cpu ${num}
	echo "thread id"
	sudo ./rfuse_driver.sh ssd fileserver 2w ${num}
	echo "2way"
	sudo ./rfuse_driver.sh ssd fileserver th ${num}
	echo "4way"
	sudo ./rfuse_driver.sh ssd fileserver 4w ${num}
	echo "8way"
	sudo ./rfuse_driver.sh ssd fileserver 8w ${num}
	echo "10way"
	sudo ./rfuse_driver.sh ssd fileserver 10w ${num}
done
