import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../app/theme/tokens.dart';

/// 记一笔维修（PRD FR5，占位）
class RepairPage extends StatelessWidget {
  const RepairPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final p = context.palette;
    return Scaffold(
      appBar: AppBar(title: Text(t.repairTitle)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _field(t.repairDate, '2026-10-07'),
          _field(t.repairIssue, '如：冷藏室不制冷，有异响……'),
          _field(t.repairProvider, '官方售后 / 第三方维修点'),
          _field(t.repairCost, '0.00'),
          const SizedBox(height: 24),
          FilledButton(onPressed: () {}, child: Text(t.repairSave)),
        ],
      ),
    );
  }

  Widget _field(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 14),
        Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF6B7280))),
        const SizedBox(height: 6),
        TextField(decoration: InputDecoration(hintText: hint)),
      ],
    );
  }
}
