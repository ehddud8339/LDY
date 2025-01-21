#!/bin/bash
#NUM=("1" "2" "3")
NUM=("1")
for num in "${NUM[@]}"
do
	#echo "fio"
	#echo "random write"
	#echo "round robin"
	#sudo ./rfuse_driver.sh ramdisk randwrite rr ${num}
	#echo "cpu id"
	#sudo ./rfuse_driver.sh ramdisk randwrite cpu ${num}
	#echo "thread id"
	#sudo ./rfuse_driver.sh ramdisk randwrite th ${num}
	#echo "2way"
	#sudo ./rfuse_driver.sh ramdisk randwrite 2w ${num}
	#echo "4way"
	#sudo ./rfuse_driver.sh ramdisk randwrite 4w ${num}
	#echo "8way"
	#sudo ./rfuse_driver.sh ramdisk randwrite 8w ${num}

	echo "10way"
	sudo ./rfuse_driver.sh ramdisk randwrite 10w ${num}

	#echo "random read"
	#echo "4w"
	#sudo ./rfuse_driver.sh ramdisk randread 4w ${num} 
	#echo "round robin"
    #sudo ./rfuse_driver.sh ramdisk randread rr ${num}
    #echo "cpu id"
    #sudo ./rfuse_driver.sh ramdisk randread cpu ${num}
    #echo "thread id"
    #sudo ./rfuse_driver.sh ramdisk randread th ${num}
    #echo "2way"
    #sudo ./rfuse_driver.sh ramdisk randread 2w ${num}
    #echo "8way"
    #sudo ./rfuse_driver.sh ramdisk randread 8w ${num}
    
	echo "10way"
	sudo ./rfuse_driver.sh ramdisk randread 10w ${num}

	echo "random read/write"
	#echo "round robin"
	#sudo ./rfuse_driver.sh ramdisk randrw rr ${num}
	#echo "cpu id"
	#sudo ./rfuse_driver.sh ramdisk randrw cpu ${num}
	#echo "thread id"
	#sudo ./rfuse_driver.sh ramdisk randrw th ${num}
	#echo "2way"
	#sudo ./rfuse_driver.sh ramdisk randrw 2w ${num}
	#echo "4way"
	#sudo ./rfuse_driver.sh ramdisk randrw 4w ${num}
	#echo "8way"
	#sudo ./rfuse_driver.sh ramdisk randrw 8w ${num}

	echo "10way"
	sudo ./rfuse_driver.sh ramdisk randrw 10w ${num}
done
