import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// 提醒详情占位（PRD FR4：主卡 + 行动包 + 已处理/延期）
class ReminderDetailPage extends StatelessWidget {
  const ReminderDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(appBar: AppBar(title: Text(t.reminderTitle)), body: Center(child: Text(t.daysLeft(30))));
  }
}
