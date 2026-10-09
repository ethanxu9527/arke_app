import 'package:flutter/material.dart';
import '../app/theme/tokens.dart';

/// 提醒卡片（PRD 设计规范：左侧 4pt 色条 + 标题 + 副文 + 时间）
enum ReminderLevel { money, right, upkeep }

class ReminderCard extends StatelessWidget {
  const ReminderCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    this.level = ReminderLevel.money,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final String time;
  final ReminderLevel level;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    final barColor = switch (level) {
      ReminderLevel.money => ArkColors.primary,
      ReminderLevel.right => p.cyan,
      ReminderLevel.upkeep => p.text3,
    };
    return Material(
      color: p.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22), side: BorderSide(color: p.divider)),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: 4, height: 64, decoration: BoxDecoration(color: barColor, borderRadius: BorderRadius.circular(2))),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, height: 1.3)),
                    const SizedBox(height: 4),
                    Text(subtitle, style: TextStyle(fontSize: 13, color: p.text2, height: 1.45)),
                    const SizedBox(height: 6),
                    Text(time, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: ArkColors.primary)),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.chevron_right, color: p.text2, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
