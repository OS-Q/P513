#!/bin/bash

echo -e "ESP IDF CONFIG"
shellPath=`pwd`

git clone -b v3.2 --recursive https://github.com/espressif/esp-idf.git
cd ./esp-idf
git submodule update --init --recursive

export IDF_PATH="$shellPath/esp-idf"
python -m pip install --user -r $IDF_PATH/requirements.txt