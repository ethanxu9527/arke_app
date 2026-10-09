import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../app/theme/tokens.dart';
import '../../common/widgets/reminder_card.dart';
import '../../common/widgets/status_badge.dart';
import '../../core/fonts/data_text.dart';

/// 首页（PRD FR4 提醒引擎入口 + 仪表盘签名）
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final p = context.palette;
    return Scaffold(
      appBar: AppBar(title: Text(t.appName)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
        children: [
          Text(t.homeGreeting('小雅'), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(t.homePending(3), style: TextStyle(fontSize: 13, color: p.text2)),
          const SizedBox(height: 12),
          // 仪表盘概览卡（签名蓝）
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: ArkColors.primary, borderRadius: BorderRadius.circular(28)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t.homeHeroTitle, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white)),
                const SizedBox(height: 12),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  _Stat(value: '32', label: t.homeCovered),
                  _Stat(value: '3', label: t.homeExpiring),
                  _Stat(value: '2', label: t.homeExtWindow),
                ]),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Row(children: [
            Expanded(child: Text(t.homeToday, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600))),
            const StatusBadge(status: ItemStatus.expiring),
          ]),
          const SizedBox(height: 10),
          // TODO(W3): 演示数据，实装后来自数据库（豁免：用户数据非 UI 文案）
          ReminderCard(
            title: '冰箱 · 延保窗口 30 天后关闭',
            subtitle: '购买后 12 个月内可补购延保，过期作废',
            time: '⏰ 2026-11-06 前决定',
            onTap: () {},
          ),
          const SizedBox(height: 10),
          ReminderCard(
            title: '洗衣机 · 部件质保还有 90 天',
            subtitle: '电机等主要部件保修至 2027-01',
            time: '⏰ 到期前 30/7/1 天提醒',
            level: ReminderLevel.right,
            onTap: () {},
          ),
          const SizedBox(height: 16),
          Text(t.homeSeeAll(3), style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: ArkColors.primary)),
          const SizedBox(height: 24),
          // 数据字体示范（PRD §设计规范）
          Text(t.demoDataText, style: TextStyle(fontSize: 11, color: p.text3)),
          const SizedBox(height: 4),
          Text('MR-WX53C · 2025-03-12 · ¥14,999 · 还剩 30 天', style: DataText.base(fontSize: 13, color: p.text)),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.value, required this.label});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value, style: DataText.strong(fontSize: 28, color: Colors.white)),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.white70)),
      ],
    );
  }
}
