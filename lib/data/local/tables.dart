import 'package:drift/drift.dart';

/// 家档数据表（PRD §7 数据模型，V1.0 本地 SQLite/Drift）
/// 命名与字段以 PRD 为唯一基准；枚举类字段以字符串存储（AppConstants/常量类约束取值），
/// 避免过早引入代码生成枚举，降低 MVP 迭代成本。

/// 家庭空间（V1.0 单例「我的家」，V1.1 家庭共享扩展）
class Homes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 64)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

/// 商品
class Items extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get homeId => integer().references(Homes, #id)();
  TextColumn get name => text().withLength(min: 1, max: 128)();
  TextColumn get category => text()(); // AppConstants 品类常量
  TextColumn get brand => text().nullable()();
  TextColumn get model => text().nullable()();
  TextColumn get serial => text().nullable()();
  DateTimeColumn get purchaseDate => dateTime()();
  RealColumn get price => real().nullable()();
  TextColumn get seller => text().nullable()();
  TextColumn get room => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('active'))(); // active/archived
  DateTimeColumn get archivedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

/// 质保条款（1:1，AI 解析或手动）
class WarrantyTerms extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get itemId => integer().references(Items, #id)();
  IntColumn get wholeMachineMonths => integer().nullable()();
  IntColumn get mainPartsMonths => integer().nullable()();
  DateTimeColumn get extWarrantyEnd => dateTime().nullable()();
  TextColumn get extPurchaseWindow => text().nullable()(); // 如「购买后 12 个月内」
  TextColumn get onsitePolicy => text().nullable()(); // 免费上门/收费/无
  TextColumn get giftServices => text().nullable()();
  TextColumn get source => text().withDefault(const Constant('manual'))(); // ai/manual
  RealColumn get confidence => real().nullable()(); // 字段级置信度 JSON 亦可，MVP 用整体置信度
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

/// 附件（本地加密文件，V1.0 不落云）
class Attachments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get itemId => integer().references(Items, #id)();
  TextColumn get filePath => text()();
  TextColumn get type => text()(); // invoice/contract/warranty_card/manual/screenshot
  TextColumn get encKeyRef => text().nullable()(); // 加密密钥引用（flutter_secure_storage）
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

/// 提醒（提醒引擎为留存第一工程，PRD FR4）
class Reminders extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get itemId => integer().references(Items, #id)();
  TextColumn get type => text()(); // warranty/ext_window/return7/return15/upkeep/subsidy
  DateTimeColumn get dueAt => dateTime()();
  TextColumn get remindAtJson => text()(); // [30,7,1] 提前量
  TextColumn get status => text().withDefault(const Constant('pending'))(); // pending/done/snoozed/ignored
  TextColumn get channel => text().withDefault(const Constant('local'))(); // local/calendar/push
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

/// 维修记录（维权证据链，PRD FR5）
class RepairRecords extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get itemId => integer().references(Items, #id)();
  DateTimeColumn get date => dateTime()();
  TextColumn get issue => text()();
  TextColumn get provider => text().nullable()();
  RealColumn get cost => real().nullable()();
  TextColumn get result => text()(); // free_warranty/paid/replaced/other
  TextColumn get attachmentsJson => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

/// 订阅/买断（V1.1 起，预留）
class Subscriptions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get tier => text()(); // free/lifetime/pro_yearly
  TextColumn get purchaseToken => text().nullable()();
  DateTimeColumn get activatedAt => dateTime().nullable()();
  DateTimeColumn get expiresAt => dateTime().nullable()();
}
