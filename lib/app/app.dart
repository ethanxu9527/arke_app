import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/theme/app_theme.dart';
import 'common/widgets/ark_shell.dart';
import 'core/constants/app_constants.dart';
import 'state/providers/locale_provider.dart';
import 'state/providers/theme_provider.dart';

/// 应用根（PRD FR12：深色默认；FR11：中英双语）
class ArkApp extends ConsumerWidget {
  const ArkApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final manualLocale = ref.watch(localeControllerProvider).locale;

    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: ArkTheme.light(),
      darkTheme: ArkTheme.dark(),
      themeMode: themeMode,
      onGenerateTitle: (ctx) => AppLocalizations.of(ctx).appName,
      locale: manualLocale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      localeResolutionCallback: (locale, supported) {
        if (manualLocale != null) return manualLocale;
        return LocaleController.resolveSystem(locale ?? const Locale('en'));
      },
      home: const ArkShell(),
    );
  }
}
