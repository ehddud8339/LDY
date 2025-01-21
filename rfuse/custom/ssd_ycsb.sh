#!/bin/bash
#NUM=("1" "2" "3")
NUM=("1")
for num in "${NUM[@]}"
do
	#echo "a"
	#echo "round robin"
	#sudo ./rfuse_driver.sh ssd a rr ${num}
	#echo "cpu id"
	#sudo ./rfuse_driver.sh ssd a cpu ${num}
	#echo "thread id"
	#sudo ./rfuse_driver.sh ssd a th ${num}
	#echo "2way"
	#sudo ./rfuse_driver.sh ssd a 2w ${num}
	#echo "4way"
	#sudo ./rfuse_driver.sh ssd a 4w ${num}
	#echo "8way"
	#sudo ./rfuse_driver.sh ssd a 8w ${num}
	#echo "10way"
	#sudo ./rfuse_driver.sh ssd a 10w ${num}

	#echo "c"
	#echo "round robin"
	#sudo ./rfuse_driver.sh ssd c rr ${num}
	#echo "cpu id"
	#sudo ./rfuse_driver.sh ssd c cpu ${num}
	#echo "thread id"
	#sudo ./rfuse_driver.sh ssd c 2w ${num}
	#echo "2way"
	#sudo ./rfuse_driver.sh ssd c th ${num}
	#echo "4way"
	#sudo ./rfuse_driver.sh ssd c 4w ${num}
	#echo "8way"
	#sudo ./rfuse_driver.sh ssd c 8w ${num}
	#echo "10way"
	#sudo ./rfuse_driver.sh ssd c 10w ${num}


	#echo "b"
	#echo "round robin"
	#sudo ./rfuse_driver.sh ssd b rr ${num}
	#echo "cpu id"
	#sudo ./rfuse_driver.sh ssd b cpu ${num}
	#echo "thread id"
	#sudo ./rfuse_driver.sh ssd b 2w ${num}
	#echo "2way"
	#sudo ./rfuse_driver.sh ssd b th ${num}
	#echo "4way"
	#sudo ./rfuse_driver.sh ssd b 4w ${num}
	#echo "8way"
	#sudo ./rfuse_driver.sh ssd b 8w ${num}
	#echo "10way"
	#sudo ./rfuse_driver.sh ssd b 10w ${num}

	#echo "d"
	#echo "round robin"
	#sudo ./rfuse_driver.sh ssd d rr ${num}
	#echo "cpu id"
	#sudo ./rfuse_driver.sh ssd d cpu ${num}
	#echo "thread id"
	#sudo ./rfuse_driver.sh ssd d 2w ${num}
	#echo "2way"
	#sudo ./rfuse_driver.sh ssd d th ${num}
	#echo "4way"
	#sudo ./rfuse_driver.sh ssd d 4w ${num}
	#echo "8way"
	#sudo ./rfuse_driver.sh ssd d 8w ${num}
	#echo "10way"
	#sudo ./rfuse_driver.sh ssd d 10w ${num}


	echo "e"
	echo "round robin"
	#sudo ./rfuse_driver.sh ssd e rr ${num}
	#echo "cpu id"
	#sudo ./rfuse_driver.sh ssd e cpu ${num}
	#echo "thread id"
	#sudo ./rfuse_driver.sh ssd e 2w ${num}
	#echo "2way"
	#sudo ./rfuse_driver.sh ssd e th ${num}
	#echo "4way"
	#sudo ./rfuse_driver.sh ssd e 4w ${num}
	#echo "8way"
	#sudo ./rfuse_driver.sh ssd e 8w ${num}
	#echo "10way"
	#sudo ./rfuse_driver.sh ssd e 10w ${num}



	echo "f"
	echo "round robin"
	sudo ./rfuse_driver.sh ssd f rr ${num}
	echo "cpu id"
	sudo ./rfuse_driver.sh ssd f cpu ${num}
	echo "thread id"
	sudo ./rfuse_driver.sh ssd f 2w ${num}
	echo "2way"
	sudo ./rfuse_driver.sh ssd f th ${num}
	echo "4way"
	sudo ./rfuse_driver.sh ssd f 4w ${num}
	echo "8way"
	sudo ./rfuse_driver.sh ssd f 8w ${num}
	echo "10way"
	sudo ./rfuse_driver.sh ssd f 10w ${num}


	echo "c"
	echo "round robin"
	sudo ./rfuse_driver.sh ssd c rr ${num}
	echo "cpu id"
	sudo ./rfuse_driver.sh ssd c cpu ${num}
	echo "thread id"
	sudo ./rfuse_driver.sh ssd c 2w ${num}
	echo "2way"
	sudo ./rfuse_driver.sh ssd c th ${num}
	echo "4way"
	sudo ./rfuse_driver.sh ssd c 4w ${num}
	echo "8way"
	sudo ./rfuse_driver.sh ssd c 8w ${num}
	echo "10way"
	sudo ./rfuse_driver.sh ssd c 10w ${num}

done
