#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Add the default password for the 'root' user（Change the empty password to 'password'）
# sed -i 's/root:::0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.::0:99999:7:::/g' package/base-files/files/etc/shadow
sed -i '/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF./d' package/lean/default-settings/files/zzz-default-settings    # 设置密码为空

# Modify default theme（FROM uci-theme-bootstrap CHANGE TO luci-theme-argon）
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile

# Modify some code adaptation
# sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' feeds/luci/applications/luci-app-cpufreq/Makefile

# Add autocore support for armvirt
# sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile

# Set DISTRIB_REVISION
# sed -i "s/OpenWrt /OpenWrt Build $(TZ=UTC-8 date "+%Y.%m.%d") Compiled By TSingui /g" package/lean/default-settings/files/zzz-default-settings
# Set etc/openwrt_release
sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/base-files/files/etc/openwrt_release
echo "DISTRIB_SOURCECODE='OpenWrt'" >>package/base-files/files/etc/openwrt_release

# Modify default IP（FROM 192.168.1.1 CHANGE TO 10.57.21.2）
sed -i 's/192.168.1.1/10.57.21.2/g' package/base-files/files/bin/config_generate

# Modify system hostname（FROM OpenWrt CHANGE TO OpenWrt-N1）
# sed -i 's/OpenWrt/OpenWrt-N1/g' package/base-files/files/bin/config_generate

# Replace the default software source
# sed -i 's#openwrt.proxy.ustclug.org#mirrors.bfsu.edu.cn\\/openwrt#' package/lean/default-settings/files/zzz-default-settings

# sed -i 's/invalid users = root/#invalid users = root/g' feeds/packages/net/samba4/files/smb.conf.template

# Add software,luci-app-amlogic
git clone https://github.com/sbwml/luci-app-alist package/luci-app-alist
svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic
git clone --depth 1 https://github.com/kongfl888/luci-app-adguardhome.git package/luci-app-adguardhome
# svn co https://github.com/lisaac/luci-app-diskman/trunk/applications/luci-app-diskman package/luci-app-diskman
git clone --depth 1 https://github.com/linkease/nas-packages-luci.git package/nas_luci
git clone --depth 1 https://github.com/linkease/nas-packages.git package/nas
git clone --depth 1 https://github.com/linkease/istore.git package/istore
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall package/luci-app-passwall
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/luci-app-passwall/packages
# git clone --depth 1 https://github.com/messense/aliyundrive-fuse.git && mv aliyundrive-fuse/openwrt/* ./package && rm -rf aliyundrive-fuse
# git clone --depth 1 https://github.com/messense/aliyundrive-webdav.git && mv aliyundrive-webdav/openwrt/* ./package && rm -rf aliyundrive-webdav
# git clone --depth 1 https://github.com/linkease/istore.git && mv istore ./package
# git clone --depth 1 https://github.com/linkease/nas-packages-luci.git && mv nas-packages-luci/luci/* ./package && rm -rf nas-packages-luci
# git clone https://github.com/kenzok8/small-package package/small-package
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# 删除重复包
rm -rf feeds/luci/applications/luci-app-argon-config
rm -rf feeds/luci/themes/luci-theme-argon
# rm -rf feeds/luci/applications/luci-app-netdata
# rm -rf package/small-package/luci-app-amlogic
# rm -rf package/small-package/luci-app-argon*
# rm -rf package/small-package/luci-theme-argon*
# rm -rf package/small-package/luci-app-koolproxyR
# rm -rf package/small-package/luci-app-godproxy
# rm -rf package/small-package/openvpn-easy-rsa-whisky
# rm -rf package/small-package/luci-app-mosdns
# rm -rf package/small-package/luci-app-openvpn-server
# rm -rf package/small-package/luci-app-store
# rm -rf package/small-package/luci-app-istorex
# rm -rf package/small-package/luci-app-quickstart
# rm -rf package/small-package/luci-app-xray
# rm -rf package/small-package/luci-app-wrtbwmon
# rm -rf package/small-package/wrtbwmon

# 其他调整
# sed -i 's#https://github.com/breakings/OpenWrt#https://github.com/tsingui/Actions_OpenWrt-Amlogic#g' package/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic
# sed -i 's#ARMv8#openwrt_armvirt#g' package/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic
# sed -i 's#opt/kernel#kernel#g' package/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic
# sed -i 's#mount -t cifs#mount.cifs#g' feeds/luci/applications/luci-app-cifs-mount/root/etc/init.d/cifs
