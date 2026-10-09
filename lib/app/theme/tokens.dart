import 'package:flutter/material.dart';

/// 家档设计令牌（PRD v1.5 · Tesla 式暗黑）
/// 对标：Tesla App / Nothing OS / 米家 / Apple 暗色规范
/// 原则：单一签名蓝 ≤5% 使用；发丝线分层级；无渐变、无玻璃、无彩色投影。
abstract final class ArkColors {
  // 签名蓝（深浅模式共用）
  static const primary = Color(0xFF3E6AE1);
  static const primarySoft = Color(0xFF6FA1FF);

  static ThemeExtension<ArkPalette> palette(Brightness b) => b == Brightness.dark
      ? ArkPalette(
          bg: const Color(0xFF101418),
          surface: const Color(0xFF1B2025),
          surface2: const Color(0xFF14181D),
          text: const Color(0xFFFFFFFF),
          text2: const Color(0xFF8A949C),
          text3: const Color(0xFF5F6870),
          divider: const Color(0x14FFFFFF), // rgba(255,255,255,.08)
          amber: const Color(0xFFE8A33D),
          cyan: const Color(0xFF5AC8FA),
          red: const Color(0xFFE5484D),
          amberTint: const Color(0x29E8A33D),
          cyanTint: const Color(0x295AC8FA),
          redTint: const Color(0x29E5484D),
        )
      : ArkPalette(
          bg: const Color(0xFFF4F5F7),
          surface: const Color(0xFFFFFFFF),
          surface2: const Color(0xFFF4F5F7),
          text: const Color(0xFF1F2329),
          text2: const Color(0xFF6B7280),
          text3: const Color(0xFF9AA1AE),
          divider: const Color(0xFFE9ECF1),
          amber: const Color(0xFFC07A1F),
          cyan: const Color(0xFF2E8FC4),
          red: const Color(0xFFD64545),
          amberTint: const Color(0x1FC07A1F),
          cyanTint: const Color(0x1F2E8FC4),
          redTint: const Color(0x1FD64545),
        );
}

@immutable
class ArkPalette extends ThemeExtension<ArkPalette> {
  const ArkPalette({
    required this.bg,
    required this.surface,
    required this.surface2,
    required this.text,
    required this.text2,
    required this.text3,
    required this.divider,
    required this.amber,
    required this.cyan,
    required this.red,
    required this.amberTint,
    required this.cyanTint,
    required this.redTint,
  });

  final Color bg;
  final Color surface;
  final Color surface2;
  final Color text;
  final Color text2;
  final Color text3;
  final Color divider;
  final Color amber; // 将到期
  final Color cyan; // 延保窗口
  final Color red; // 已过保
  final Color amberTint;
  final Color cyanTint;
  final Color redTint;

  @override
  ArkPalette copyWith({Color? bg}) =>
      ArkPalette(bg: bg ?? this.bg, surface: surface, surface2: surface2, text: text, text2: text2, text3: text3, divider: divider, amber: amber, cyan: cyan, red: red, amberTint: amberTint, cyanTint: cyanTint, redTint: redTint);

  @override
  ArkPalette lerp(ThemeExtension<ArkPalette>? other, double t) => this;
}

extension ArkThemeX on BuildContext {
  ArkPalette get palette => Theme.of(this).extension<ArkPalette>()!;
}
