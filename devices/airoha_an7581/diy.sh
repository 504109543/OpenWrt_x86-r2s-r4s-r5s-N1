#!/bin/bash

shopt -s extglob

rm -rf target/linux/generic target/linux/airoha/!(hack-6.18) package/kernel package/firmware package/boot package/utils/fitblk

git_clone_path main https://github.com/openwrt/openwrt package/kernel target/linux/generic
git_clone_path master https://github.com/coolsnowwolf/lede target/linux/airoha package/boot package/firmware package/utils/fitblk

wget -N https://github.com/coolsnowwolf/lede/raw/refs/heads/master/package/kernel/mt76/patches-6.18/110-mt7915-add-mt7916-cal-free-merge.patch -P package/kernel/mt76/patches/

git_clone_path master https://github.com/coolsnowwolf/lede mv target/linux/generic/hack-6.18
git_clone_path master https://github.com/coolsnowwolf/lede mv target/linux/airoha/hack-6.18

wget -N https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/generic/pending-6.18/613-netfilter_optional_tcp_window_check.patch -P target/linux/generic/pending-6.18/
wget -N https://github.com/coolsnowwolf/lede/raw/refs/heads/master/target/linux/generic/pending-6.18/511-block-fitblk-initialize-device-before-probing.patch -P target/linux/generic/pending-6.18/

rm -rf target/linux/airoha/patches-6.18/{801*,802*,804*,931-net-pcs*}

rm -rf package/feeds/kiddin9/{quectel_QMI_WWAN,simcom_QMI_WWAN,fibocom_QMI_WWAN,quectel_MHI,rkp-ipid,fast-classifier} package/feeds/packages/{v4l2loopback,libpfring}
