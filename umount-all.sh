#!/bin/bash

sudo umount output/system/odm/
sudo umount output/system/product/
sudo umount output/system/system_ext/
sudo umount output/system/vendor/
sudo umount output/system/

rm -rf output/system
