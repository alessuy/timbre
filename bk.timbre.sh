#! /bin/bash

P_INPUT="0"
P_OUTPUT="1"
RING_TIME="3"
LOG="/var/www/html/timbre.txt"

function check_input(){
        gpio read $P_INPUT
}

function timbrar(){
        gpio write $P_OUTPUT 0
        reporte >> $LOG
        sleep $RING_TIME
        gpio write $P_OUTPUT 1
}

function reporte(){
        echo "$(date) SONO Timbre"
	ssh sysadmin@192.168.0.15 python telegram.py
}

while (true) do
        status=$(check_input)
        if [ $status -eq 1 ]
        then
                timbrar
        fi
        #exit 0
done

