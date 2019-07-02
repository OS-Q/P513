#!/bin/bash
shellPath=`pwd`
SDKPath=$HOME/espressif

function set_esp8266_sdk()
{
    	if [ ! -d $SDKPath ]; then
		mkdir $SDKPath
    	fi
	if [ ! -d $SDKPath/ESP8266_NONOS_V3 ]; then	
		cd $SDKPath
		git clone --depth=1 https://github.com/espressif/ESP8266_NONOS_SDK.git ESP8266_NONOS_V3
	fi
	if [ -d $SDKPath/ESP8266_NONOS_V3 ]; then		
		echo 'export IDF_PATH='$SDKPath'/ESP8266_NONOS_V3' >> ~/.bashrc
		source  ~/.bashrc
		echo -e "done ESP8266_NONOS_SDK path !\n${Line}"   	
	else
		echo -e "exist ESP8266_NONOS_SDK NULL folder \n${Line}"
	fi	
}

set_esp8266_sdk



