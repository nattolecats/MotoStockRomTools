#!/bin/bash

CUR_DIR=$(pwd)
TOOLS_PATH=./tools

mkdir -p repack/

# Boot image
${TOOLS_PATH}/otatools/bin/mkbootfs output/boot/ramdisk/ | gzip -c > output/boot/boot.img-ramdisk
${TOOLS_PATH}/mkbootimg \
    --kernel output/boot/boot.img-kernel \
    --ramdisk output/boot/boot.img-ramdisk \
    --cmdline "'$(cat output/boot/boot.img-cmdline)'" \
    --header_version $(cat output/boot/boot.img-header_version) \
    --os_patch_level $(cat output/boot/boot.img-os_patch_level) \
    --os_version $(cat output/boot/boot.img-os_version) \
    --output repack/boot.img

# Vendor Boot image
${TOOLS_PATH}/otatools/bin/mkbootfs output/vendor_boot/ramdisk/ | gzip -c > output/vendor_boot/vendor_boot.img-vendor_ramdisk
${TOOLS_PATH}/mkbootimg \
    --dtb output/vendor_boot/vendor_boot.img-dtb \
    --vendor_ramdisk output/vendor_boot/vendor_boot.img-vendor_ramdisk \
    --vendor_cmdline "'$(cat output/vendor_boot/vendor_boot.img-vendor_cmdline)'" \
    --base $(cat output/vendor_boot/vendor_boot.img-base) \
    --dtb_offset $(cat output/vendor_boot/vendor_boot.img-dtb_offset) \
    --header_version $(cat output/vendor_boot/vendor_boot.img-header_version) \
    --kernel_offset $(cat output/vendor_boot/vendor_boot.img-kernel_offset) \
    --pagesize $(cat output/vendor_boot/vendor_boot.img-pagesize) \
    --ramdisk_offset $(cat output/vendor_boot/vendor_boot.img-ramdisk_offset) \
    --tags_offset $(cat output/vendor_boot/vendor_boot.img-tags_offset) \
    --vendor_boot repack/vendor_boot.img

echo "* done."
