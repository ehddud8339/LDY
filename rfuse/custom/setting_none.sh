#!/bin/bash

set -euo pipefail

sch=$1

sleep 1

set +euo pipefail
echo -e "\n\n\n			MAKE		\n\n\n"
pushd ../../driver/rfuse/
make
sleep 3
./rfuse_insmod.sh
echo -e "\n\n\n                 MAKEEND                 \n\n\n"
sleep 1
echo -e "\n\n\n			LIBMAKE			\n\n\n"
cd ../../lib/librfuse
./librfuse_install.sh
sleep 1
popd
echo -e "\n\n\n			LIBMAKEEND			\n\n\n"
set -euo pipefail

sudo sync
echo 3 > /proc/sys/vm/drop_caches
