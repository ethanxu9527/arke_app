import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 语言三档（PRD FR11）：跟随系统 / 简体中文 / English；默认跟随系统
enum LocaleMode { followSystem, zh, en }

const _key = 'locale_mode';

class LocaleController extends StateNotifier<LocaleMode> {
  LocaleController(this._prefs) : super(_read(_prefs));

  final SharedPreferences _prefs;

  static LocaleMode _read(SharedPreferences p) =>
      LocaleMode.values.asNameMap()[p.getString(_key)] ?? LocaleMode.followSystem;

  Future<void> set(LocaleMode m) async {
    state = m;
    await _prefs.setString(_key, m.name);
  }

  /// 中文系统 → zh；其它语言系统 → en（出海后按市场扩展）
  static Locale resolveSystem(Locale system) =>
      system.languageCode == 'zh' ? const Locale('zh') : const Locale('en');

  Locale? get locale => switch (state) {
        LocaleMode.followSystem => null, // 交给 localeResolutionCallback
        LocaleMode.zh => const Locale('zh'),
        LocaleMode.en => const Locale('en'),
      };
}

final localeControllerProvider = StateNotifierProvider<LocaleController, LocaleMode>(
  (ref) => LocaleController(ref.watch(sharedPrefsProvider)),
);
