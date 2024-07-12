#!/bin/bash

# Make directory
mkdir -p output/system/
mkdir -p output/system/system_ext/
mkdir -p output/system/product/
mkdir -p output/system/vendor/
mkdir -p output/system/system_dlkm
mkdir -p output/system/vendor_dlkm

# Mount images
sudo mount -t erofs -o ro,loop output/system_a.img output/system/
sudo mount -t erofs -o ro,loop output/system_ext_a.img output/system/system_ext/
sudo mount -t erofs -o ro,loop output/product_a.img output/system/product/
sudo mount -t erofs -o ro,loop output/vendor_a.img output/system/vendor/
sudo mount -t erofs -o ro,loop output/system_dlkm_a.img output/system/system_dlkm/
sudo mount -t erofs -o ro,loop output/vendor_dlkm_a.img output/system/vendor_dlkm/
sudo mount output/system/vendor/odm output/system/odm --bind
