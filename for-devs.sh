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
TARGET=boot.img-ramdisk
unlz4 -f ../$TARGET ../tmp
if [ $? -eq 0 ] ; then
    TARGET=tmp
fi
gunzip -c ../$TARGET | cpio -i
if [ $? -ne 0 ] ; then
    cat ../$TARGET | cpio -i
fi
rm -rf ../tmp

cd ../../vendor_boot/ramdisk/
TARGET=vendor_boot.img-vendor_ramdisk
unlz4 -f ../$TARGET ../tmp
if [ $? -eq 0 ] ; then
    TARGET=tmp
fi
gunzip -c ../$TARGET | cpio -i
if [ $? -ne 0 ] ; then
    cat ../$TARGET | cpio -i
fi
rm -rf ../tmp

cd $CUR_DIR

echo "* Running twrpdtgen script..."

mkdir -p output/twrp/
cd output/twrp/

pip3 install twrpdtgen
python3 -m twrpdtgen ../../../boot.img

echo "* Done!"
