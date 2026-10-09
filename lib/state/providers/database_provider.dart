import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/local/app_database.dart';

/// 数据库单例（PRD §7 本地优先）
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

/// 便捷：商品表查询
final itemsProvider = StreamProvider<List<Item>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.select(db.items).watch();
});
