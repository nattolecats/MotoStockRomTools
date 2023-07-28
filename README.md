# Stock ROM tools & scripts for Motorola devices

Simply tools & scripts for myself, but feel free to can use this for development, or etc.
To use this tools, unzip motorola stock rom zip and `git clone` it into that.

## Generate super.img, and extract inside images

```
bash extract-superimg.sh
```

The super.img will output to: **../** (Stock ROM directory)

The inside images will output to: **output/**

## Convert to sparse images

```
bash convert-to-sparse.sh
```

The sparse images will output to: **output/raw/**

**NOTE: This process needed for flashing via fastbootd.**

## Mount images and make accessable to proprietary files (for devs)

```
bash mount-all.sh
```

The images will mounted to:
* output/system/
* output/system/system_ext
* output/system/product
* output/system/vendor

After mount these, you can refer [this guide](https://wiki.lineageos.org/extracting_blobs_from_zips#extracting-proprietary-blobs-from-payload-based-otas) to extract blobs and use it for custom rom developments.
