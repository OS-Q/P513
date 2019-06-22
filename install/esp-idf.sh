#!/bin/bash
shellPath=`pwd`
WorkPath=$shellPath/..
IDFPath=$WorkPath/..

cd $IDFPath
git clone -b --recursive https://github.com/espressif/esp-idf.git
cd $IDFPath/esp-idf
git submodule update --init --recursive

echo 'export IDF_PATH="${IDFPath}/esp-idf"' >> /etc/profile
python -m pip install --user -r $IDF_PATH/requirements.txt
./add_path.sh
