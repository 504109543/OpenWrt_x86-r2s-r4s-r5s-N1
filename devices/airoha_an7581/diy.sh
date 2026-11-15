#!/bin/bash

shopt -s extglob

rm -rf target/linux/generic target/linux/airoha package/kernel package/firmware package/boot package/utils/fitblk

git_clone_path master https://github.com/coolsnowwolf/lede target/linux/generic target/linux/airoha package/boot package/firmware package/utils/fitblk
git_clone_path main https://github.com/openwrt/openwrt package/kernel

wget -N https://github.com/coolsnowwolf/lede/raw/refs/heads/master/package/kernel/mt76/patches-6.18/110-mt7915-add-mt7916-cal-free-merge.patch -P package/kernel/mt76/patches-6.18/

wget -N https://github.com/coolsnowwolf/lede/raw/refs/heads/master/include/kernel-6.18 -P target/linux/generic/
