#!/bin/bash
shellPath=`pwd`

function get_xtensa-esp32()
{
	if [ ! -d  $shellPath/download ]; then
        cd $shellPath/
		sudo mkdir download
    fi
    if [ ! -f $shellPath/download/xtensa-esp32-elf.tar.gz ]; then
        cd $shellPath/download
		wget -O xtensa-esp32-elf.tar.gz https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
    fi
	if [ ! -d  $shellPath/download/xtensa-esp32-elf ]; then
        cd $shellPath/download
		sudo mkdir xtensa-esp32-elf
		sudo tar -xzvf xtensa-esp32-elf.tar.gz  -C xtensa-esp32-elf --strip-components 1 
    fi
	echo "finish download xtensa-esp32-elf \n${Line}"
}

get_xtensa-esp32
