#!/bin/bash

TARGET_DIR=../
TOOLS_PATH=./tools/otatools/bin

echo "* Generating super partition image from sparse_chunks..."
$TOOLS_PATH/simg2img $(ls -v ../super.img_sparsechunk.*) ../super.img

mkdir -p output

echo "* Unpacking dynamic partition images..."
$TOOLS_PATH/lpunpack ../super.img output/

echo "* Done."
