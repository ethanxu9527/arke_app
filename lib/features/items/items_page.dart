import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../app/theme/tokens.dart';

/// 商品列表（PRD FR3 台账，占位：后续接 drift itemsProvider）
class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final p = context.palette;
    return Scaffold(
      appBar: AppBar(title: Text(t.itemsTitle)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(decoration: InputDecoration(prefixIcon: const Icon(Icons.search), hintText: t.itemsSearch)),
          const SizedBox(height: 16),
          Text(t.itemsTotal(0), style: TextStyle(fontSize: 13, color: p.text2)),
          const SizedBox(height: 12),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Text(t.itemsEmpty, style: TextStyle(fontSize: 15, color: p.text3)),
            ),
          ),
        ],
      ),
    );
  }
}
