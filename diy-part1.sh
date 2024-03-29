#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >> feeds.conf.default
# echo 'src-git luci-app-amlogic https://github.com/ophub/luci-app-amlogic.git;main' >> feeds.conf.default
#istore
# echo 'src-git nas_luci https://github.com/linkease/nas-packages-luci.git;main' >> feeds.conf.default
# echo 'src-git nas https://github.com/linkease/nas-packages.git;master' >> feeds.conf.default
# echo 'src-git istore https://github.com/linkease/istore.git;main' >> feeds.conf.default
#passwall
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main' >> feeds.conf.default
# echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main' >> feeds.conf.default
# echo 'src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git;main' >> feeds.conf.default

## 解除系统限制
ulimit -u 10000
ulimit -n 4096
ulimit -d unlimited
ulimit -m unlimited
ulimit -s unlimited
ulimit -t unlimited
ulimit -v unlimited
