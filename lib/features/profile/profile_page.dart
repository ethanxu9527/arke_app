import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/theme/tokens.dart';
import '../../core/constants/app_constants.dart';
import '../../state/providers/locale_provider.dart';
import '../../state/providers/theme_provider.dart';

/// 我的（PRD FR9 设置合规 + FR11 语言 + FR12 外观）
class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    final p = context.palette;
    final themeMode = ref.watch(themeControllerProvider);
    final localeMode = ref.watch(localeControllerProvider);

    return Scaffold(
      appBar: AppBar(title: Text(t.profileTitle)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _card(p, child: Column(children: [
            Row(children: [
              Container(width: 52, height: 52, decoration: BoxDecoration(color: ArkColors.primary, borderRadius: BorderRadius.circular(16)), child: const Icon(Icons.home, color: Colors.white)),
              const SizedBox(width: 14),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(t.profileHome, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                Text(t.profileFreeQuota(0, 3), style: TextStyle(fontSize: 11, color: p.text3)),
              ]),
            ]),
          ])),
          const SizedBox(height: 20),
          _section(t.profileAppearance),
          _card(p, child: Column(children: [
            for (final (m, label) in [
              (AppearanceMode.followSystem, t.appearanceFollowSystem),
              (AppearanceMode.light, t.appearanceLight),
              (AppearanceMode.dark, t.appearanceDark),
            ])
              RadioListTile<AppearanceMode>(
                value: m,
                groupValue: themeMode,
                onChanged: (v) => ref.read(themeControllerProvider.notifier).set(v!),
                title: Text(label),
                activeColor: ArkColors.primary,
                dense: true,
              ),
          ])),
          const SizedBox(height: 20),
          _section(t.profileLanguage),
          _card(p, child: Column(children: [
            for (final (m, label) in [
              (LocaleMode.followSystem, t.appearanceFollowSystem),
              (LocaleMode.zh, '简体中文'),
              (LocaleMode.en, 'English'),
            ])
              RadioListTile<LocaleMode>(
                value: m,
                groupValue: localeMode,
                onChanged: (v) => ref.read(localeControllerProvider.notifier).set(v!),
                title: Text(label),
                activeColor: ArkColors.primary,
                dense: true,
              ),
          ])),
          const SizedBox(height: 20),
          _section(t.profileAbout),
          _card(p, child: Column(children: [
            _row(p, t.profileFilingNo, AppConstants.icpFilingNo),
            _row(p, t.profileVersion, '0.1.0'),
          ])),
        ],
      ),
    );
  }

  Widget _section(String title) => Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 4),
        child: Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
      );

  Widget _card(BuildContext p, {required Widget child}) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(color: p.surface, borderRadius: BorderRadius.circular(22), border: Border.all(color: p.divider)),
        child: child,
      );

  Widget _row(BuildContext p, String k, String v) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(k, style: TextStyle(fontSize: 14, color: p.text2)),
          Text(v, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        ]),
      );
}
