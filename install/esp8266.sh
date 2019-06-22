#!/bin/bash
shellPath=`pwd`

function get_xtensa_esp8266()
{
    	if [ ! -f $shellPath/xtensa-lx106-elf.tar.gz ]; then
        	cd $shellPath
		wget -O xtensa-lx106-elf.tar.gz https://dl.espressif.com/dl/xtensa-lx106-elf-linux64-1.22.0-92-g8facf4c-5.2.0.tar.gz
    	fi
	if [ ! -d  $shellPath/xtensa-lx106-elf/bin ]; then
        	cd $shellPath
		mkdir xtensa-lx106-elf
		tar -xzvf xtensa-lx106-elf.tar.gz  -C xtensa-lx106-elf --strip-components 1 
		echo -e "finish esp8266 xtensa-lx106-elf \n${Line}"   	
	else
		echo -e "error esp8266 xtensa-lx106-elf \n${Line}"
	fi
	
}

get_xtensa_esp8266
