#!/bin/bash

export WorkPath=`pwd`

## Root Password
for ((i = 0; i < 5; i++)); do
	PASSWD=$(whiptail --title "ESP Config System" \
		--passwordbox "Enter root password. Don't use root or sudo run it" \
		10 60 3>&1 1>&2 2>&3)
	if [ $i = "4" ]; then
		whiptail --title "Note Qitas" --msgbox "Invalid password" 10 40 0	
		exit 0
	fi

	sudo -k
	if sudo -lS &> /dev/null << EOF
$PASSWD
EOF
	then
		i=10
	else
		whiptail --title "ESP Config System" --msgbox "Invalid password, Pls input corrent password" \
		10 40 0	--cancel-button Exit --ok-button Retry
	fi
done

echo $PASSWD | sudo ls &> /dev/null 2>&1



OPTION=$(whiptail --title "ESP Env Config System" \
	--menu "$MENUSTR" 20 60 12 --cancel-button Finish --ok-button Select \
	"0"   "AUTO" \
	"1"   "esp8266 tools" \
	"2"   "esp32 tools" \
	"3"   "SDK update" \
	"4"   "make & flash" \
	"5"   "com debug" \
	3>&1 1>&2 2>&3)
	

if [ $OPTION = '0' ]; then
	clear
	echo -e "xtensa tools\n${Line}"
	if [ -d  $WorkPath/install ]; then
        cd $WorkPath/install
		chmod +x ./tools.sh
		sudo ./tools.sh 
    fi
	exit 0
elif [ $OPTION = '1' ]; then
	clear
	echo -e "esp8266 tools install\n${Line}"
	if [ -d  $WorkPath/install ]; then
        cd $WorkPath/install
		chmod +x ./esp8266.sh
		sudo ./esp8266.sh 
    	fi
	exit 0
elif [ $OPTION = '2' ]; then
	clear
	echo -e "esp32 tools install\n${Line}"
	if [ -d  $WorkPath/install ]; then
        cd $WorkPath/install
		chmod +x ./esp32.sh
		sudo ./esp32.sh 
    	fi
	exit 0
elif [ $OPTION = '3' ]; then
	clear
	echo -e "SDK update\n${Line}"
	if [ -d  $WorkPath/install ]; then
        cd $WorkPath/install
		chmod +x ./esp-idf.sh
		sudo ./esp-idf.sh 
    	fi
	exit 0	
elif [ $OPTION = '4' ]; then
	clear
	echo -e "make & flash\n${Line}"
	exit 0
elif [ $OPTION = '5' ]; then
	clear
	echo -e "com debug\n${Line}"
	if [ -d  $WorkPath/server ]; then
        cd $WorkPath/server

    	fi
	exit 0
else
	whiptail --title "ESP Config System" \
		--msgbox "Please select correct option" 10 50 0
	exit 0
fi



exit 0
