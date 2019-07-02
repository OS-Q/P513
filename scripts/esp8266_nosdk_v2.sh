#!/bin/bash
shellPath=`pwd`
SDKPath=$HOME/espressif

function set_esp8266_sdk()
{
    	if [ ! -d $SDKPath ]; then
		mkdir $SDKPath
    	fi
	cd $SDKPath
	#git clone --depth=1 https://github.com/espressif/ESP8266_NONOS_SDK.git
	git clone -b release/v2.2.x --depth=1 https://github.com/espressif/ESP8266_NONOS_SDK.git
	cd $SDKPath/ESP8266_NONOS_SDK
	if [ -f $SDKPath/ESP8266_NONOS_SDK/Makefile ]; then		
		echo 'export IDF_PATH='$SDKPath'/ESP8266_NONOS_SDK' >> ~/.bashrc
		source  ~/.bashrc
		echo -e "done ESP8266_NONOS_SDK path !\n${Line}"   	
	else
		echo -e "exist ESP8266_NONOS_SDK NULL folder \n${Line}"
	fi	
}

set_esp8266_sdk



