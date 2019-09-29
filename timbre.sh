#! /bin/bash

P_INPUT="0"
P_OUTPUT="1"
RING_TIME="3"
SCRPATH="/home/pi/timbre"
LOG="/home/pi/timbre/timbre.txt"

function check_input(){
        gpio read $P_INPUT
}

function timbrar(){
        gpio write $P_OUTPUT 0
        sleep $RING_TIME
        gpio write $P_OUTPUT 1
}

function reporte(){
        echo "$(date) SONO Timbre"
	 python3 $SCRPATH/telegram.py
}

function foto(){
	uvccapture -m -x640 -y480 -B100 -S190 -C180 -G2 -o"$SCRPATH/timbre.jpg"  -v >> /dev/null
}


if [ $# -eq 1 ]
  then
	echo  "$(date) Monitor Mode ON" >> $LOG
	while (true) do
        	status=$(check_input)
        	if [ $status -eq 1 ]
        		then
				foto
			        reporte >> $LOG
        	fi
	done
  else
	echo  "$(date) Monitor Mode OFF" >> $LOG
	while (true) do
                status=$(check_input)
                if [ $status -eq 1 ]
                        then
			    foto
			    timbrar  
                            reporte >> $LOG
                fi
        done

 fi
