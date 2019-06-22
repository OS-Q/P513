#!/bin/bash
shellPath=`pwd`
SDKPath=$HOME/espressif

function set_esp8266_rtos()
{
    	if [ ! -d $SDKPath ]; then
		mkdir $SDKPath
    	fi
	cd $SDKPath
	git clone --depth=1 https://github.com/espressif/ESP8266_RTOS_SDK.git
	cd $SDKPath/ESP8266_RTOS_SDK
	if [ -f $SDKPath/ESP8266_RTOS_SDK/requirements.txt ]; then		
		echo 'export IDF_PATH='$SDKPath'/ESP8266_RTOS_SDK' >> ~/.bashrc
		source ~/.bashrc
		echo -e "done ESP8266_RTOS_SDK path !\n${Line}"   	
	else
		echo -e "exist ESP8266_RTOS_SDK NULL folder \n${Line}"
	fi	
}

set_esp8266_rtos



