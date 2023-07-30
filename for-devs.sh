#!/bin/bash

CUR_DIR=$(pwd)
TOOLS_PATH=./tools

mkdir -p output/boot/
mkdir -p output/vendor_boot/

echo "* Extracting boot image and vendor_boot image..."

$TOOLS_PATH/unpackbootimg -i ../boot.img -o output/boot/
$TOOLS_PATH/unpackbootimg -i ../vendor_boot.img -o output/vendor_boot/

mkdir -p output/boot/ramdisk/
mkdir -p output/vendor_boot/ramdisk/

echo "* Extracting both ramdisk..."

cd output/boot/ramdisk/
gunzip -c ../boot.img-ramdisk | cpio -i

cd ../../vendor_boot/ramdisk/
gunzip -c ../vendor_boot.img-vendor_ramdisk | cpio -i

cd $CUR_DIR

echo "* Running twrpdtgen script..."

mkdir -p output/twrp/
cd output/twrp/

pip3 install twrpdtgen
python3 -m twrpdtgen ../../../boot.img

echo "* Done!"
