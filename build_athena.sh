#!/usr/bin/env bash
# ==================================================
# 京东云雅典娜（RE-CS-02）LibWRT 专用编译脚本
# Platform: IPQ6010 / ipq60xx
# Kernel  : OpenWrt / LibWRT 6.x
# ==================================================

set -e

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
CFG_DIR="$ROOT_DIR/compilecfg"

TARGET="jdcloud_ipq60xx_libwrt"
INI_FILE="$CFG_DIR/${TARGET}.ini"

if [ ! -f "$INI_FILE" ]; then
  echo "❌ 未找到雅典娜 LibWRT 配置："
  echo "   $INI_FILE"
  exit 1
fi

echo "======================================"
echo " 京东云雅典娜 LibWRT 固件编译"
echo " 设备 : RE-CS-02 (Athena)"
echo " SoC  : IPQ6010"
echo " 内核 : 6.x (LibWRT)"
echo "======================================"

chmod +x "$ROOT_DIR/build.sh"

exec "$ROOT_DIR/build.sh" "$TARGET"