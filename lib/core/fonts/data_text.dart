import 'package:flutter/widgets.dart';

/// 数据字体（PRD §设计规范 / 《家档字体选型分析.md》）
/// Intel One Mono（SIL OFL-1.1）——仅用于「机器可读的精确数据」：
/// 序列号 / 型号 / 日期 / 金额 / 质保期数值 / 倒计时数字。
/// 禁止用于中文正文、标题、按钮文案。
abstract final class DataText {
  static const family = 'IntelOneMono';

  static TextStyle base({double? fontSize, Color? color}) => TextStyle(
        fontFamily: family,
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w500,
        fontFeatures: const [FontFeature.tabularFigures()],
        letterSpacing: -0.01,
      );

  static TextStyle strong({double? fontSize, Color? color}) => TextStyle(
        fontFamily: family,
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w700,
        fontFeatures: const [FontFeature.tabularFigures()],
        letterSpacing: -0.01,
      );

  /// 与中文混排时整体观感配平（x-height 略大 → 字号 -0.5pt）
  static TextStyle merged(TextStyle ui, {Color? color}) => base(
        fontSize: (ui.fontSize ?? 14) - 0.5,
        color: color ?? ui.color,
      );
}

/// 中文句中夹数字的用法（PRD FR11 规范：只给数字片段换字体）
/// Text.rich(TextSpan(children: DataText.spanMix('还剩 ', 30, ' 天', uiStyle: ui)));
extension DataTextSpan on DataText {
  static List<InlineSpan> spanMix(String prefix, Object value, String suffix, {TextStyle? uiStyle}) => [
        TextSpan(text: prefix, style: uiStyle),
        TextSpan(text: '$value', style: base(fontSize: uiStyle?.fontSize, color: uiStyle?.color)),
        TextSpan(text: suffix, style: uiStyle),
      ];
}
