#!/bin/bash
shellPath=`pwd`

function get_xtensa_esp8266()
{
	if [ ! -d  $shellPath/download ]; then
        cd $shellPath/
		mkdir download
    	fi
    	if [ ! -f $shellPath/download/xtensa-lx106-elf.tar.gz ]; then
        cd $shellPath/download
		wget -O xtensa-lx106-elf.tar.gz https://dl.espressif.com/dl/xtensa-lx106-elf-linux64-1.22.0-92-g8facf4c-5.2.0.tar.gz
    	fi
	if [ ! -d  $shellPath/download/xtensa-lx106-elf ]; then
        cd $shellPath/download
		mkdir xtensa-lx106-elf
		tar -xzvf xtensa-lx106-elf.tar.gz  -C xtensa-lx106-elf --strip-components 1 
		echo -e "finish download xtensa-lx106-elf \n${Line}"   	
	else
		echo -e "error download xtensa-lx106-elf \n${Line}"
	fi
	
}

get_xtensa_esp8266
