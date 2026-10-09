#!/usr/bin/env python3
# 硬编码中文检查（PRD FR11 验收：代码内零硬编码中文，CI 集成）
# 豁免：① 注释中的中文；② lib/l10n/ ARB 资源；③ TODO 标注的演示数据行。
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
VIOLATIONS = []

zh_re = re.compile(r"[\u4e00-\u9fa5]")

for f in sorted((ROOT / "lib").rglob("*.dart")):
    if "lib/l10n" in str(f):
        continue
    for i, raw in enumerate(f.read_text(encoding="utf-8").splitlines(), 1):
        code = raw.split("//")[0]  # 去掉行注释；/* */ 块注释含中文按豁免（少见，人工把关）
        # 匹配单/双引号字符串字面量中含中文
        for m in re.finditer(r"(['\"])(?:(?!\1).)*[\u4e00-\u9fa5](?:(?!\1).)*\1", code):
            if "TODO" in raw:
                continue  # 演示数据豁免
            VIOLATIONS.append(f"{f.relative_to(ROOT)}:{i}: {m.group(0)[:50]}")

if VIOLATIONS:
    print("✗ 发现疑似硬编码中文（请改走 ARB，或标注 TODO 演示数据）：")
    for v in VIOLATIONS:
        print("  " + v)
    sys.exit(1)

print("✓ 无硬编码中文（注释 / TODO 演示数据 / ARB 豁免）")
