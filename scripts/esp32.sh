#!/bin/bash
shellPath=`pwd`
WorkPath=$HOME/espressif

function set_xtensa_esp32()
{
    	if [ ! -d $WorkPath ]; then
		mkdir $WorkPath
    	fi
    	if [ ! -f $shellPath/xtensa-esp32-elf.tar.gz ]; then
		cd $shellPath
		wget -O xtensa-esp32-elf.tar.gz https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
    	fi
	if [ ! -d  $WorkPath/xtensa-esp32-elf/bin ]; then
        	cd $WorkPath
		mkdir xtensa-esp32-elf
		tar -xzvf $shellPath/xtensa-esp32-elf.tar.gz  -C xtensa-esp32-elf --strip-components 1 
		echo -e "finish esp32 xtensa-esp32-elf \n${Line}"   	
	else
		echo -e "exist xtensa-esp32-elf folder\n${Line}"
	fi
	if [ -d  $WorkPath/xtensa-esp32-elf/bin ]; then
		echo 'export PATH='$WorkPath'/xtensa-esp32-elf/bin:$PATH' >> ~/.bashrc
		source ~/.bashrc
		echo -e "export xtensa-esp32-elf path\n${Line}"   	
	fi
}

set_xtensa_esp32
