#!/bin/bash

set -euo pipefail

sch=$1

sleep 1

if [ ${sch} == "cpu" ]; then
	set +euo pipefail
	echo -e "\n\n\n			CPUID		\n\n\n"
	pushd ../../driver/copy/
	cp cpuId.c ../rfuse/rfuse_dev.c
	cd ../rfuse/
	make clean
	make
	sleep 3
	./rfuse_insmod.sh
	echo -e "\n\n\n                 MAKEEND                 \n\n\n"
	sleep 1

	cd ../../lib/librfuse
	./librfuse_install.sh
	sleep 1
	popd
	set -euo pipefail

elif [ ${sch} == "th" ]; then
	set +euo pipefail
	echo -e "\n\n\n			THREADID		\n\n\n"
        pushd ../../driver/copy/
        cp threadId.c ../rfuse/rfuse_dev.c
        cd ../rfuse/
	make clean
        make
        sleep 3
        ./rfuse_insmod.sh
		echo -e "\n\n\n                 MAKEEND                 \n\n\n"
		sleep 1

        cd ../../lib/librfuse
        ./librfuse_install.sh
        sleep 1
        popd
        set -euo pipefail

elif [ ${sch} == "rr" ]; then
        set +euo pipefail
	echo -e "\n\n\n			ROUNDROBIN		\n\n\n"
        pushd ../../driver/copy/
        cp roundrobin.c ../rfuse/rfuse_dev.c
        cd ../rfuse/
	make clean
        make
        sleep 3
        ./rfuse_insmod.sh
		echo -e "\n\n\n                 MAKEEND                 \n\n\n"
		sleep 1


        cd ../../lib/librfuse
        ./librfuse_install.sh
        sleep 1
        popd
        set -euo pipefail

elif [ ${sch} == "2w" ]; then
        set +euo pipefail
	echo -e "\n\n\n                 2WAY              \n\n\n"
        pushd ../../driver/copy/
        cp 2way.c ../rfuse/rfuse_dev.c
        cd ../rfuse/
	make clean
        make
        sleep 3
        ./rfuse_insmod.sh
		echo -e "\n\n\n                 MAKEEND                 \n\n\n"
		sleep 1

        cd ../../lib/librfuse
        ./librfuse_install.sh
        sleep 1
        popd
        set -euo pipefail

elif [ ${sch} == "4w" ]; then
        set +euo pipefail
	echo -e "\n\n\n                 4WAY              \n\n\n"
        pushd ../../driver/copy/
        cp 4way.c ../rfuse/rfuse_dev.c
        cd ../rfuse/
        make
        sleep 3
        ./rfuse_insmod.sh
		echo -e "\n\n\n                 MAKEEND                 \n\n\n"
		sleep 1

        cd ../../lib/librfuse
        ./librfuse_install.sh
        sleep 1
        popd
        set -euo pipefail

elif [ ${sch} == "8w" ]; then
        set +euo pipefail
		echo -e "\n\n\n                 8WAY              \n\n\n"
        pushd ../../driver/copy/
        cp 8way.c ../rfuse/rfuse_dev.c
        cd ../rfuse/
        make
        sleep 3
        ./rfuse_insmod.sh
		echo -e "\n\n\n                 MAKEEND                 \n\n\n"
		sleep 1

        cd ../../lib/librfuse
        ./librfuse_install.sh
        sleep 1
        popd
        set -euo pipefail

elif [ ${sch} == "10w" ]; then
        set +euo pipefail
		echo -e "\n\n\n                 10WAY              \n\n\n"
        pushd ../../driver/copy/
        cp 10way.c ../rfuse/rfuse_dev.c
        cd ../rfuse/
	make clean
        make
        sleep 3
        ./rfuse_insmod.sh
		echo -e "\n\n\n                 MAKEEND                 \n\n\n"
		sleep 1

        cd ../../lib/librfuse
        ./librfuse_install.sh
        sleep 1
        popd
        set -euo pipefail
elif [ ${sch} == "dynamic" ]; then
        set +euo pipefail
		echo -e "\n\n\n                 dynamic              \n\n\n"
        pushd ../../driver/copy/
        cp dynamic.c ../rfuse/rfuse_dev.c
        cd ../rfuse/
	make clean
        make
        sleep 3
        ./rfuse_insmod.sh
		echo -e "\n\n\n                 MAKEEND                 \n\n\n"
		sleep 1

        cd ../../lib/librfuse
        ./librfuse_install.sh
        sleep 1
        popd
        set -euo pipefail
else
	echo "Wrong scheduler name"
fi
