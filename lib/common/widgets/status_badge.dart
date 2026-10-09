import 'package:flutter/material.dart';
import '../app/theme/tokens.dart';
import '../core/fonts/data_text.dart';

/// 商品状态徽标（PRD 设计规范：颜色 + 文字双通道，不单靠颜色）
enum ItemStatus { covered, expiring, expired, extWindow }

class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.status, this.label, this.date});

  final ItemStatus status;
  final String? label; // 覆盖默认文案
  final String? date; // statusCovered 时展示到期日

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    final (text, bg, dot) = switch (status) {
      ItemStatus.covered => (label ?? '在保 · 至 $date', p.cyan, p.cyanTint),
      ItemStatus.expiring => (label ?? '将到期', p.amber, p.amberTint),
      ItemStatus.expired => (label ?? '已过保', p.red, p.redTint),
      ItemStatus.extWindow => (label ?? '延保窗口', p.cyan, p.cyanTint),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(999)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 6, height: 6, decoration: BoxDecoration(color: dot, shape: BoxShape.circle)),
          const SizedBox(width: 5),
          Text(text, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: dot)),
        ],
      ),
    );
  }
}

/// 倒计时数字（数据字体 · 仪表盘签名）
class DashboardNumber extends StatelessWidget {
  const DashboardNumber({super.key, required this.value, required this.label, this.emphasize = false});

  final String value;
  final String label;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value,
            style: DataText.strong(
              fontSize: emphasize ? 34 : 26,
              color: emphasize ? ArkColors.primary : p.text,
            )),
        const SizedBox(height: 2),
        Text(label, style: TextStyle(fontSize: 11, color: p.text2)),
      ],
    );
  }
}

/// 主按钮（实色签名蓝 · 无渐变）
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.label, this.onTap, this.ghost = false});

  final String label;
  final VoidCallback? onTap;
  final bool ghost;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ghost
          ? OutlinedButton(onPressed: onTap, child: Text(label))
          : ElevatedButton(onPressed: onTap, child: Text(label)),
    );
  }
}
