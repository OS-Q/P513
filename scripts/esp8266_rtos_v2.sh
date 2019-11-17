#!/bin/bash
shellPath=`pwd`
SDKPath=$HOME/toolchain/espressif

function set_esp8266_rtos_v2()
{
    	if [ ! -d $SDKPath ]; then
		mkdir $SDKPath
    	fi
	cd $SDKPath
	git clone -b release/v2.x.x --depth=1 https://github.com/espressif/ESP8266_RTOS_SDK.git ESP8266_RTOS_V2
	if [ -d $SDKPath/ESP8266_RTOS_V2/driver_lib ]; then		
		echo 'export IDF_PATH='$SDKPath'/ESP8266_RTOS_V2' >> ~/.bashrc
		echo -e "done ESP8266_RTOS_SDK path !\n${Line}"   	
	else
		echo -e "exist ESP8266_RTOS_V2 folder \n${Line}"
	fi	
}

set_esp8266_rtos_v2



