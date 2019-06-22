#!/bin/bash
shellPath=`pwd`
IDFPath=$HOME/espressif

function set_esp_idf()
{
    	if [ ! -d $IDFPath ]; then
		mkdir $IDFPath
    	fi
	cd $IDFPath
	git clone --recursive https://github.com/espressif/esp-idf.git
	cd $IDFPath/esp-idf
	git submodule update --init --recursive
	if [ -f $IDFPath/esp-idf/add_path.sh ]; then		
		echo 'export IDF_PATH='$IDFPath'/esp-idf' >> ~/.bashrc
		source ~/.bashrc
		$IDFPath/esp-idf/add_path.sh
		python -m pip install --user -r $IDF_PATH/requirements.txt
		echo -e "done esp-idf path !\n${Line}"   	
	fi	
}

set_esp_idf



