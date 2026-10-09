#!/usr/bin/env bash
# 家档（Arke）字体获取脚本
# Intel One Mono（SIL OFL-1.1）——数据字体：序列号/型号/日期/金额/倒计时
# 仓库仅提供 Regular / Medium / Bold 三档 TTF（无 SemiBold，用 Bold 作强调档）
# 用法：bash tool/fetch_fonts.sh
set -euo pipefail

BASE="https://cdn.jsdelivr.net/gh/intel/intel-one-mono@main/fonts/ttf"
DEST="assets/fonts"
mkdir -p "$DEST"

for w in Regular Medium Bold; do
  echo "下载 IntelOneMono-$w.ttf ..."
  curl -sL -o "$DEST/IntelOneMono-$w.ttf" "$BASE/IntelOneMono-$w.ttf"
done

echo "下载 OFL-1.1 许可文本（随包分发）..."
curl -sL -o "$DEST/OFL.txt" "https://cdn.jsdelivr.net/npm/@fontsource/intel-one-mono@5.3.0/LICENSE"

echo "校验："
file "$DEST"/*.ttf
grep -qi "SIL OPEN FONT LICENSE" "$DEST/OFL.txt" && echo "✓ OFL.txt 有效" || echo "✗ OFL.txt 异常，请手动从 fontsource 获取"
