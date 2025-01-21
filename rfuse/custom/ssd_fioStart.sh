#!/bin/bash
#NUM=("1" "2" "3")
NUM=("1")
for num in "${NUM[@]}"
do
	echo "fio"
	echo "random write"
	echo "round robin"
	#sudo ./rfuse_driver.sh ssd write_ssd rr ${num}
	#echo "cpu id"
	#sudo ./rfuse_driver.sh ssd write_ssd cpu ${num}
	#echo "thread id"
	#sudo ./rfuse_driver.sh ssd write_ssd th ${num}
	#echo "2way"
	#sudo ./rfuse_driver.sh ssd write_ssd 2w ${num}
	#echo "4way"
	#sudo ./rfuse_driver.sh ssd write_ssd 4w ${num}
	#echo "8way"
	#sudo ./rfuse_driver.sh ssd write_ssd 8w ${num}
	#echo "10way"
	#sudo ./rfuse_driver.sh ssd write_ssd 10w ${num}


	echo "random read"
	#echo "round robin"
   	#sudo ./rfuse_driver.sh ssd read_ssd rr ${num}
	#echo "cpu id"
	#sudo ./rfuse_driver.sh ssd read_ssd cpu ${num}
	#echo "thread id"
	#sudo ./rfuse_driver.sh ssd read_ssd th ${num}
   	#echo "2way"
   	#sudo ./rfuse_driver.sh ssd read_ssd 2w ${num}
	#echo "4way"
	#sudo ./rfuse_driver.sh ssd read_ssd 4w ${num} 
    #echo "8way"
    #sudo ./rfuse_driver.sh ssd read_ssd 8w ${num}
	#echo "10way"
	#sudo ./rfuse_driver.sh ssd read_ssd 10w ${num}

	#echo "random read/write"
	#echo "round robin"
	#sudo ./rfuse_driver.sh ssd rw_ssd rr ${num}
	#echo "cpu id"
	#sudo ./rfuse_driver.sh ssd rw_ssd cpu ${num}
	#echo "thread id"
	#sudo ./rfuse_driver.sh ssd rw_ssd th ${num}
	#echo "2way"
	#sudo ./rfuse_driver.sh ssd rw_ssd 2w ${num}
	echo "4way"
	sudo ./rfuse_driver.sh ssd rw_ssd 4w ${num}
	echo "8way"
	sudo ./rfuse_driver.sh ssd rw_ssd 8w ${num}
	echo "10way"
	sudo ./rfuse_driver.sh ssd rw_ssd 10w ${num}
done
