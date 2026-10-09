import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 外观三档（PRD FR12）：followSystem / light / dark；默认 dark（产品视觉定位）
enum AppearanceMode { followSystem, light, dark }

const _key = 'appearance_mode';

class ThemeController extends StateNotifier<AppearanceMode> {
  ThemeController(this._prefs) : super(_read(_prefs));

  final SharedPreferences _prefs;

  static AppearanceMode _read(SharedPreferences p) =>
      AppearanceMode.values.asNameMap()[p.getString(_key)] ?? AppearanceMode.dark;

  Future<void> set(AppearanceMode m) async {
    state = m;
    await _prefs.setString(_key, m.name);
  }

  ThemeMode get themeMode => switch (state) {
        AppearanceMode.followSystem => ThemeMode.system,
        AppearanceMode.light => ThemeMode.light,
        AppearanceMode.dark => ThemeMode.dark,
      };
}

final sharedPrefsProvider = Provider<SharedPreferences>((ref) => throw UnimplementedError('main 中 override'));

final themeControllerProvider = StateNotifierProvider<ThemeController, AppearanceMode>(
  (ref) => ThemeController(ref.watch(sharedPrefsProvider)),
);

final themeModeProvider = Provider<ThemeMode>((ref) => ref.watch(themeControllerProvider).themeMode);
