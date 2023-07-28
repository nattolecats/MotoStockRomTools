#!/bin/bash

TOOLS_PATH=./tools/otatools/bin

mkdir -p output/raw/

echo "* Converting extracted images to sparse..."
$TOOLS_PATH/img2simg output/system_a.img output/raw/system.img
$TOOLS_PATH/img2simg output/system_ext_a.img output/raw/system_ext.img
$TOOLS_PATH/img2simg output/product_a.img output/raw/product.img
$TOOLS_PATH/img2simg output/vendor_a.img output/raw/vendor.img

echo "* Done."
echo "* Now you can flash images via fastbootd."
echo "  or, you can use the vendor.img as prebuilt vendor."
echo "* Please check out: output/raw/*.img"
