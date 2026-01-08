#!/usr/bin/env bash
# ============================================
# 京东云雅典娜（RE-CS-02 / IPQ6010）专用编译脚本
# repo: ycl2006/wrt_release
# ============================================

set -e

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
CFG_DIR="$ROOT_DIR/compilecfg"

# 选择固件类型：
# immortalwrt 或 libwrt
# FLAVOR="immortalwrt"
FLAVOR="libwrt"

TARGET="jdcloud_ipq60xx_${FLAVOR}"
INI_FILE="$CFG_DIR/${TARGET}.ini"

if [ ! -f "$INI_FILE" ]; then
  echo "❌ 未找到雅典娜配置文件："
  echo "   $INI_FILE"
  exit 1
fi

echo "======================================"
echo " 京东云雅典娜 固件编译"
echo " 设备  : RE-CS-02 (Athena)"
echo " 平台  : IPQ6010 / ipq60xx"
echo " 源码  : $FLAVOR"
echo " target: $TARGET"
echo "======================================"

chmod +x "$ROOT_DIR/build.sh"

exec "$ROOT_DIR/build.sh" "$TARGET"