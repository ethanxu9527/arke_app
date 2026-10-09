import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'tables.dart';

part 'app_database.g.dart';

/// 家档本地数据库（PRD §7：本地优先 Local-First）
/// 生成代码：dart run build_runner build --delete-conflicting-outputs
@DriftDatabase(tables: [Homes, Items, WarrantyTerms, Attachments, Reminders, RepairRecords, Subscriptions])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'arke'));

  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async => m.createAll(),
        beforeOpen: (details) async {
          // 预留迁移钩子：future 版本 schemaVersion 递增后写 step-by-step 迁移
        },
      );
}
