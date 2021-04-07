#!/bin/sh

set -e

chunzhen_url=http://update.cz88.net/soft/setup.zip
innoextract_path=$(pwd)/exe_tool/innoextract


# down
wget $chunzhen_url

# unzip
unzip setup.zip
chmod +x "$innoextract_path"
ls -al "$innoextract_path"
$innoextract_path setup.exe



mkdir -p build/stand
mkdir -p build/raw
cp ./app/qqwry.dat ./build/.


node src/packer.js
node src/packer_raw.js

tar czf ./build/stand/qqwry.tar.gz ./build/stand/qqwry.ipdb



