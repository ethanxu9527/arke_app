# 家档（Arke）Flutter 工程

家庭商品质保与售后档案管家。视觉 v1.5（Tesla 式暗黑，深色默认 + 三档外观）；双语（zh-Hans / en）；数据字体 Intel One Mono（OFL-1.1）。

## 快速开始

```bash
# 1. 生成平台工程（本目录已含 lib/assets/l10n，用 flutter create 补平台目录）
flutter create . --platforms=ios,android --org com.arke --project-name arke

# 2. 依赖
flutter pub get

# 3. 代码生成（顺序执行）
flutter gen-l10n                              # l10n.yaml → lib/l10n 生成 AppLocalizations
dart run build_runner build --delete-conflicting-outputs   # drift 表 → .g.dart

# 4. 字体与图标（已随仓库提交；如需重新获取字体）
bash tool/fetch_fonts.sh

# 5. 运行
flutter run
```

## 结构

```
lib/
├── main.dart / app/app.dart      # 根：主题(深色默认) + 双语 + 三档外观
├── app/theme/                    # tokens.dart（Tesla 双模式色板）· app_theme.dart
├── core/
│   ├── constants/                # 付费档/备案号/提醒提前量
│   ├── fonts/data_text.dart      # Intel One Mono 数据字体（白名单用法）
│   └── utils/formatters.dart     # intl 格式化（日期 ISO/金额）
├── data/local/                   # drift 表（PRD §7）+ AppDatabase
├── state/providers/              # theme / locale / database（Riverpod）
├── common/widgets/               # StatusBadge · ReminderCard · PrimaryButton · ArkShell
└── features/                     # 8 个页面骨架（占位，按 PRD 里程碑逐周实装）
```

## 关键约定

- **深色默认**：首次启动即深色（PRD FR12），「我的 → 外观」三档，`themeControllerProvider` 持久化。
- **双语**：文案全部走 ARB（`lib/l10n/app_zh.arb` 为源文件），代码内零硬编码中文；切换即时生效。
- **数据字体白名单**：序列号/型号/日期/金额/倒计时 → `DataText.base/strong`；禁止用于中文正文。
- **布局铁律**（踩坑总结）：纵向内容流 + 卡片高度自适应 + 长文本 wrap；详见工作区 `AGENTS.md`。
- **合规**：字体随包分发 `assets/fonts/OFL.txt`；备案号占位 `core/constants/app_constants.dart`。

## 待办（按 PRD §10 里程碑）

| 周 | 内容 | 对应代码 |
| --- | --- | --- |
| W1 | OCR 三引擎 spike + 评测集 | （独立脚本，不在此工程） |
| W2 | 本地存储 + 手动建档 | data/local + features/add |
| W3 | 拍照建档 + 端侧 OCR 预填 | features/add Step1–2 |
| W4 | AI 条款解析 + 确认 UI + 提醒引擎 | features/add Step3 + features/reminders |
| W5 | 维修记录 + 附件加密 + 导出 + IAP | features/repair + paywall |
| W6–8 | 内测 + 修复 + 提审 | — |
