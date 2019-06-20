#!/bin/bash

echo -e "ESP IDF CONFIG"
shellPath=`pwd`
cd $shellPath
git clone -b v3.2 --recursive https://github.com/espressif/esp-idf.git
cd $shellPath/esp-idf
git submodule update --init --recursive

export IDF_PATH="$shellPath/esp-idf"
python -m pip install --user -r $IDF_PATH/requirements.txt
./add_path.sh