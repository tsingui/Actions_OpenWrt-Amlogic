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
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile

# Modify some code adaptation
# sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' feeds/luci/applications/luci-app-cpufreq/Makefile

# Add autocore support for armvirt
# sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile

# Set DISTRIB_REVISION
# sed -i "s/OpenWrt /OpenWrt Build $(TZ=UTC-8 date "+%Y.%m.%d") Compiled By TSingui /g" package/lean/default-settings/files/zzz-default-settings
# Set etc/openwrt_release
sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/base-files/files/etc/openwrt_release
echo "DISTRIB_SOURCECODE='OpenWrt'" >>package/base-files/files/etc/openwrt_release

# Modify default IP（FROM 192.168.1.1 CHANGE TO 10.0.0.2）
sed -i 's/192.168.1.1/10.0.0.2/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/10.0.0.2/g' package/base-files/luci2/bin/config_generate
sed -i 's/192.168.1.1/10.0.0.2/g' package/base-files/Makefile
sed -i 's/192.168.1.255/10.0.0.255/g' package/base-files/Makefile

# Modify system hostname（FROM OpenWrt CHANGE TO OpenWrt-N1）
sed -i 's/OpenWrt/Tomato/g' package/base-files/files/bin/config_generate
sed -i 's/LEDE/Tomato/g' package/base-files/files/bin/config_generate
sed -i 's/LEDE/Tomato/g' package/base-files/luci2/bin/config_generate

# Replace the default software source
# sed -i 's#openwrt.proxy.ustclug.org#mirrors.bfsu.edu.cn\\/openwrt#' package/lean/default-settings/files/zzz-default-settings

# sed -i 's/invalid users = root/#invalid users = root/g' feeds/packages/net/samba4/files/smb.conf.template

# Add software,luci-app-amlogic
# svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic
# git clone --depth 1 https://github.com/ophub/luci-app-amlogic.git && mv luci-app-amlogic/luci-app-amlogic package/luci-app-amlogic
# svn co https://github.com/lisaac/luci-app-diskman/trunk/applications/luci-app-diskman package/luci-app-diskman
# git clone --depth 1 https://github.com/lisaac/luci-app-diskman.git && mv luci-app-diskman/applications/luci-app-diskman package/luci-app-diskman && rm -rf luci-app-diskman
# svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall package/luci-app-passwall
git clone --depth 1 https://github.com/sbwml/luci-app-alist package/luci-app-alist
git clone --depth 1 https://github.com/ophub/luci-app-amlogic.git package/luci-app-amlogic
git clone --depth 1 https://github.com/kongfl888/luci-app-adguardhome.git package/luci-app-adguardhome
git clone --depth 1 https://github.com/kiddin9/openwrt-clouddrive2.git package/clouddrive2
git clone --depth 1 https://github.com/gdck/luci-app-cupsd.git package/luci-app-cupsd
# git clone --depth 1 https://github.com/sirpdboy/luci-app-ddns-go.git package/luci-app-ddns-go
git clone --depth 1 https://github.com/lisaac/luci-app-dockerman.git package/luci-app-dockerman
git clone --depth 1 https://github.com/vernesong/OpenClash.git package/OpenClash
# mkdir -p package/luci-app-diskman && wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/applications/luci-app-diskman/Makefile -O package/luci-app-diskman/Makefile
# mkdir -p package/parted && wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/Parted.Makefile -O package/parted/Makefile
# git clone --depth 1 https://github.com/linkease/nas-packages-luci.git package/nas_luci
# git clone --depth 1 https://github.com/linkease/nas-packages.git package/nas
# git clone --depth 1 https://github.com/linkease/istore.git package/istore
# git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall
# git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/luci-app-passwall/packages
# git clone --depth 1 https://github.com/messense/aliyundrive-fuse.git && mv aliyundrive-fuse/openwrt/* ./package && rm -rf aliyundrive-fuse
# git clone --depth 1 https://github.com/messense/aliyundrive-webdav.git && mv aliyundrive-webdav/openwrt/* ./package && rm -rf aliyundrive-webdav
# git clone --depth 1 https://github.com/linkease/istore.git && mv istore ./package
# git clone --depth 1 https://github.com/linkease/nas-packages-luci.git && mv nas-packages-luci/luci/* ./package && rm -rf nas-packages-luci
# git clone https://github.com/kenzok8/small-package package/small-package
# theme for openwrt-23.05
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
# theme for lede
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
# git clone -b 18.06 https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# 删除重复包
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-argon-config
rm -rf feeds/luci/applications/luci-app-alist
rm -rf feeds/luci/applications/luci-app-adguardhome
# rm -rf feeds/luci/applications/luci-app-ddns-go
rm -rf feeds/luci/applications/luci-app-dockerman
rm -rf feeds/luci/applications/luci-app-openclash
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-passwall2
# rm -rf feeds/luci/applications/luci-app-diskman
# rm -rf package/small-package/luci-app-amlogic
# rm -rf package/small-package/luci-app-argon*
# rm -rf package/small-package/luci-theme-argon*
# rm -rf feeds/luci/applications/luci-app-netdata
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
