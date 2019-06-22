#!/bin/bash
shellPath=`pwd`

function get_xtensa_esp8266()
{
	if [ ! -d  $shellPath/download ]; then
        cd $shellPath/
		sudo mkdir download
    fi
    if [ ! -f $shellPath/download/xtensa-lx106-elf.tar.gz ]; then
        cd $shellPath/download
		wget -O xtensa-lx106-elf.tar.gz https://dl.espressif.com/dl/xtensa-lx106-elf-linux64-1.22.0-92-g8facf4c-5.2.0.tar.gz
    fi
	if [ ! -d  $shellPath/download/xtensa-lx106-elf ]; then
        cd $shellPath/download
		sudo mkdir xtensa-lx106-elf
		sudo tar -xzvf xtensa-lx106-elf.tar.gz  -C xtensa-lx106-elf --strip-components 1 
    fi
	echo "finish download xtensa-lx106-elf \n${Line}"
}

get_xtensa_esp8266
