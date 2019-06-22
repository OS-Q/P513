#!/bin/bash
shellPath=`pwd`
WorkPath=$shellPath/..
IDFPath=$WorkPath/..

echo -e "ESP IDF CONFIG"

cd $IDFPath
git clone -b v3.2 --recursive https://github.com/espressif/esp-idf.git
cd $IDFPath/esp-idf
git submodule update --init --recursive

export IDF_PATH="$IDFPath/esp-idf"
python -m pip install --user -r $IDF_PATH/requirements.txt
./add_path.sh
