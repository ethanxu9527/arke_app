import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// 引导页（PRD FR1，占位：3 屏价值主张 + 游客直入）
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.onDone});
  final VoidCallback onDone;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const Spacer(),
          Container(width: 150, height: 150, decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(44)), child: const Icon(Icons.inventory_2, size: 64, color: Colors.white)),
          const SizedBox(height: 32),
          Text(t.onbTitle1, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 12),
          Text(t.onbSub1, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall),
          const Spacer(),
          SizedBox(width: double.infinity, height: 52, child: ElevatedButton(onPressed: onDone, child: Text(t.onbStart))),
          const SizedBox(height: 24),
        ]),
      ),
    );
  }
}
