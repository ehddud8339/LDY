#!/bin/bash
scrtype=$1
sch=$2
while true; do
        dmesg -c >> /home/ldy/rfuse/bench/custom/cpu_log/${scrtype}_${sch}.txt
        sleep 0.001
done
