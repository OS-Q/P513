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

function port_config()
{
	sudo usermod -a -G dialout $USER 
}
function apt_install()
{
	sudo apt install -y gcc wget make flex bison gperf gawk grep
	sudo apt install -y gettext automake flex texinfo libtool libtool-bin libncurses-dev 
	sudo apt install -y python python-dev python-pip python-setuptools python-serial python-cryptography python-future
	sudo apt autoremove -y 
}
function set_esp8266()
{
	str="xtensa-lx106-elf-cc :    "
	ret=`whereis xtensa-lx106-elf-cc`
	#echo ${#ret}
	#echo ${#str}
	if [ ${#ret} -lt ${#str} ]; then
		if [ -f  $WorkPath/scripts/esp8266.sh ]; then
			chmod +x $WorkPath/scripts/esp8266.sh
			#$WorkPath/scripts/esp8266.sh 
		else
			echo -e "no exist esp8266.sh \n${Line}"
		fi
	else
		echo -e "have config xtensa-lx106-elf path \n${Line}"
	fi
}

function set_esp32()
{
	str="xtensa-esp32-elf-cc :    "
	ret=`whereis xtensa-esp32-elf-cc`
	#echo ${#ret}
	#echo ${#str}
	if [ ${#ret} -lt ${#str} ]; then
		if [ -f  $WorkPath/scripts/esp32.sh ]; then
			chmod +x $WorkPath/scripts/esp32.sh
			$WorkPath/scripts/esp32.sh 
		else
			echo -e "no exist esp32.sh \n${Line}"
		fi
	else
		echo -e "have config xtensa-esp32-elf path \n${Line}"
	fi
}
function set_esp_idf()
{
	if [ -f  $WorkPath/scripts/esp-idf.sh ]; then
		chmod +x $WorkPath/scripts/esp-idf.sh
		$WorkPath/scripts/esp-idf.sh 
    	fi
}
function set_esp8266_rtos()
{
	if [ -f  $WorkPath/scripts/esp8266_rtos.sh ]; then
		chmod +x $WorkPath/scripts/esp8266_rtos.sh
		$WorkPath/scripts/esp8266_rtos.sh 
    	fi
}
function set_esp8266_sdk()
{
	if [ -f  $WorkPath/scripts/esp8266_sdk.sh ]; then
		chmod +x $WorkPath/scripts/esp8266_sdk.sh
		$WorkPath/scripts/esp8266_sdk.sh 
    	fi
}
OPTION=$(whiptail --title "ESP Env Config System" \
	--menu "$MENUSTR" 20 60 12 --cancel-button Finish --ok-button Select \
	"0"   "AUTO" \
	"1"   "esp8266 tools" \
	"2"   "esp32 tools" \
	"3"   "esp-idf update" \
	"4"   "esp8266 rtos" \
	"5"   "esp8266 sdk" \
	3>&1 1>&2 2>&3)
	

if [ $OPTION = '0' ]; then
	clear
	echo -e "AUTO all\n${Line}"
	set_esp32
	set_esp_idf
	set_esp8266
	set_esp8266_sdk
	set_esp8266_rtos
	port_config
	exit 0
elif [ $OPTION = '1' ]; then
	clear
	echo -e "esp8266 tools scripts\n${Line}"
	set_esp8266
	exit 0
elif [ $OPTION = '2' ]; then
	clear
	echo -e "esp32 tools scripts\n${Line}"
	set_esp32
	exit 0
elif [ $OPTION = '3' ]; then
	clear
	echo -e "esp-idf install\n${Line}"
	apt_install
	set_esp_idf
	exit 0	
elif [ $OPTION = '4' ]; then
	clear
	echo -e "esp8266 rtos\n${Line}"
	set_esp8266_rtos
	exit 0
elif [ $OPTION = '5' ]; then
	clear
	echo -e "esp8266 sdk\n${Line}"
	set_esp8266_sdk
    	fi
	exit 0
else
	whiptail --title "ESP Config System" \
		--msgbox "Please select correct option" 10 50 0
	exit 0
fi



exit 0
