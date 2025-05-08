#!/bin/bash

CUR_DIR=$(pwd)
TOOLS_PATH=./tools

mkdir -p repack/

# Boot image

# Vendor Boot image

# System partitions
for p in vendor system system_ext product ; do
    #mkfs.erofs -b 4096 -z lz4hc,9 -C 262144 repack/$p.raw.img ../$p/

    mkfs.erofs \
        -E legacy-compress \
        -z lz4 \
        -C 262144 \
        -b 4096 \
        repack/$p.raw.img \
        ../$p/

    $TOOLS_PATH/otatools/bin/img2simg repack/$p.raw.img repack/$p.img
    rm -rf repack/$p.raw.img

done

#rm -rf repack/*.raw.img

echo "* done."
