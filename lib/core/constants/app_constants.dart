/// 全局常量
abstract final class AppConstants {
  static const appName = '家档';
  static const appNameEn = 'Arke';
  static const version = '0.1.0';

  /// 付费档（PRD FR8）
  static const freeItemLimit = 3;
  static const lifetimePrice = 48; // 内测价（原价 68）
  static const lifetimePriceFull = 68;
  static const subPriceYearly = 18;

  /// 备案号（上架前替换为真实备案号；FR9 合规）
  static const icpFilingNo = '京ICP备XXXXXXXX号-1A';

  /// 存储目录
  static const attachmentsDir = 'attachments';
  static const exportsDir = 'exports';

  /// 提醒提前量（天）：质保到期前 30/7/1；延保窗口前 30/7（PRD FR4）
  static const warrantyLeadDays = [30, 7, 1];
  static const extWindowLeadDays = [30, 7];
}
