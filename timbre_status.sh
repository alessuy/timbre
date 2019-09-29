#! /bin/bash

SCRPATH="/home/pi/timbre"
P_OUTPUT="1"

ps -ef | grep $SCRPATH/timbre.sh | grep bash >> /dev/null
if [ $? -eq 0 ]
 	then
   		PID=$(ps -ef | grep $SCRPATH/timbre.sh | grep bash | awk '{print $2}')
   		RUN="1"  #Corriendo
 	else
   		RUN="0"
fi

case $1 in
"start") if [ $RUN -eq 1 ]
		then
			echo "El proceso esta corriendo con PID $PID"
	 	else
			bash  $SCRPATH/timbre.sh &
	fi;;
"stop") if [ $RUN -eq 1 ]
		then
			kill $PID
		else
			echo "El proceso no esta corriendo."
		fi;;
"restart") if [ $RUN -eq 1 ]
                then
                        kill $PID
                        bash $SCRPATH/timbre.sh &
                else
                        bash $SCRPATH/timbre.sh &
                fi;;

"status") if [ $RUN -eq 1 ]
                then
                        echo "El proceso esta corriendo con PID $PID"
                else
                        echo "EL proceso no esta corriendo"
        fi;;

"monitor") if [ $RUN -eq 1 ]
		then
			kill $PID
			bash $SCRPATH/timbre.sh monitor &
		else
			bash $SCRPATH/timbre.sh monitor &
		fi;;

"ring") if [ $RUN -eq 1 ]
                then
			 gpio write $P_OUTPUT 0
        		 sleep 2
        		 gpio write $P_OUTPUT 1
                fi;;



*) echo 'Opciones:
	start: inicia el proceso de monitoreo del timbre. Si el proceso esta corriendo avisa con que pid.
	stop: detiene el proceso.
	restart: detiene el proceso y lo vuelve a iniciar. O lo inicia si no esta corriendo.
	status: Inidica si el proceso esta corriendo o no.
	monitor: si esta corriendo el proceso lo detiene e inicia en modo monitor. Si no esta correindo lo inicia en modo monitor. El modo
	monitor realiza el monitoreo del pulsador pero no suena la campanilla solo hace el registro del evento
	ring: Hace sonar el timbre';;

esac


