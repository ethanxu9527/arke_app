import 'package:intl/intl.dart';

/// 格式化工具（PRD FR11：数字/日期/金额一律经 intl，禁止手拼）
abstract final class Fmt {
  /// 数据字段统一 ISO（可核对性优先），如 2025-03-12
  static String dateIso(DateTime d) => DateFormat('yyyy-MM-dd').format(d);

  /// 长句中的日期本地化显示
  static String dateLocalized(DateTime d, String locale) =>
      DateFormat(locale == 'zh' ? 'yyyy年M月d日' : 'MMM d, yyyy').format(d);

  /// 金额：¥14,999
  static String money(num v, {String symbol = '¥'}) =>
      '$symbol${NumberFormat('#,##0', 'en_US').format(v)}';

  /// 倒计时天数（intl 负数规则由调用方处理）
  static String daysLeft(int days, String locale) =>
      locale == 'zh' ? '还剩 $days 天' : (days == 1 ? '1 day left' : '$days days left');
}
