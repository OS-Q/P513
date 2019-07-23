#!/bin/bash

export WorkPath=`pwd`

## Root Password
for ((i = 0; i < 5; i++)); do
	PASSWD=$(whiptail --title "espressif config system" \
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

function set_esp8266_gcc()
{
	str="xtensa-lx106-elf-cc :  "
	ret=`whereis xtensa-lx106-elf-cc`
	if [ ${#ret} -lt ${#str} ]; then
		if [ -f  $WorkPath/scripts/xtensa-lx106.sh ]; then
			chmod +x $WorkPath/scripts/xtensa-lx106.sh
			$WorkPath/scripts/xtensa-lx106.sh
			source  ~/.bashrc
		else
			echo -e "no exist xtensa-lx106.sh \n${Line}"
		fi
	else
		echo -e "have config xtensa-lx106 gcc\n${Line}"
	fi
}

function set_esp32_gcc()
{
	str="xtensa-esp32-elf-cc :    "
	ret=`whereis xtensa-esp32-elf-cc`
	if [ ${#ret} -lt ${#str} ]; then
		if [ -f  $WorkPath/scripts/xtensa-esp32.sh ]; then
			chmod +x $WorkPath/scripts/xtensa-esp32.sh
			$WorkPath/scripts/xtensa-esp32.sh 
			source  ~/.bashrc
		else
			echo -e "no shell xtensa-esp32.sh \n${Line}"
		fi
	else
		echo -e "have config xtensa-esp32 gcc\n${Line}"
	fi
}
function set_esp_idf()
{
	if [ -f  $WorkPath/scripts/esp_idf.sh ]; then
		chmod +x $WorkPath/scripts/esp_idf.sh
		$WorkPath/scripts/esp_idf.sh
		source  ~/.bashrc
    	fi
}
function set_esp8266_rtos()
{
	if [ -f  $WorkPath/scripts/esp8266_rtos.sh ]; then
		chmod +x $WorkPath/scripts/esp8266_rtos.sh
		$WorkPath/scripts/esp8266_rtos.sh 
		source  ~/.bashrc
    	fi
}
function set_esp8266_rtos_v2()
{
	if [ -f  $WorkPath/scripts/esp8266_rtos.sh ]; then
		chmod +x $WorkPath/scripts/esp8266_rtos_v2.sh
		$WorkPath/scripts/esp8266_rtos_v2.sh 
		source ~/.bashrc
    	fi
}
function set_esp8266_nosdk()
{
	if [ -f  $WorkPath/scripts/esp8266_nosdk.sh ]; then
		chmod +x $WorkPath/scripts/esp8266_nosdk.sh
		$WorkPath/scripts/esp8266_nosdk.sh 
		source  ~/.bashrc
		gedit  ~/.bashrc
    	fi
}

function set_esp8266_nosdk_v2()
{
	if [ -f  $WorkPath/scripts/esp8266_nosdk_v2.sh ]; then
		chmod +x $WorkPath/scripts/esp8266_nosdk_v2.sh
		$WorkPath/scripts/esp8266_nosdk_v2.sh 
		source  ~/.bashrc
		gedit  ~/.bashrc
    	fi
}

OPTION=$(whiptail --title "espressif config system" \
	--menu "$MENUSTR" 20 60 12 --cancel-button Finish --ok-button Select \
	"0"   "AUTO ESP8266" \
	"1"   "AUTO ESP32" \
	"2"   "GCC tools" \
	"3"   "esp-idf" \
	"4"   "esp8266 RTOS V3" \
	"5"   "esp8266 RTOS V2" \
	"6"   "esp8266 NOSDK V3" \
	"7"   "esp8266 NOSDK V2" \
	3>&1 1>&2 2>&3)

# config port user mod	
apt_install
port_config

if [ $OPTION = '0' ]; then
	clear
	echo -e "AUTO ESP8266\n${Line}"
	set_esp8266_gcc
	set_esp8266_rtos	
	exit 0
elif [ $OPTION = '1' ]; then
	clear
	echo -e "AUTO ESP32\n${Line}"
	set_esp32_gcc
	set_esp_idf
	exit 0
elif [ $OPTION = '2' ]; then
	clear
	echo -e "GCC tools\n${Line}"
	set_esp8266_gcc
	set_esp32_gcc
	exit 0
elif [ $OPTION = '3' ]; then
	clear
	echo -e "esp-idf\n${Line}"
	set_esp_idf
	exit 0	
elif [ $OPTION = '4' ]; then
	clear
	echo -e "config ESP8266 RTOS V3\n${Line}"
	set_esp8266_rtos
	exit 0
elif [ $OPTION = '5' ]; then
	clear
	echo -e "config ESP8266 RTOS V2\n${Line}"
	set_esp8266_rtos_v2
    	fi
	exit 0
elif [ $OPTION = '6' ]; then
	clear
	echo -e "config ESP8266 NOSDK V3\n${Line}"
	set_esp8266_nosdk
    	fi
	exit 0
elif [ $OPTION = '7' ]; then
	clear
	echo -e "config ESP8266 NOSDK V2\n${Line}"
	set_esp8266_nosdk_v2
    	fi
	exit 0
else
	whiptail --title "espressif config system" \
		--msgbox "Please select correct option" 10 50 0
	exit 0
fi



exit 0
