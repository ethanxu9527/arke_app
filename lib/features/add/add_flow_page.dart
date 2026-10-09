import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// 建档四步流占位（PRD FR2：分类 → 拍照 → AI 确认 → 完成）
/// W3 实装：Step1 分类九宫格、Step2 相机+文档边缘检测、Step3 AI 确认（低置信标黄）、Step4 完成
class AddFlowPage extends StatelessWidget {
  const AddFlowPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(t.addTitle)),
      body: Center(child: Text(t.addStep1, style: Theme.of(context).textTheme.titleLarge)),
    );
  }
}
