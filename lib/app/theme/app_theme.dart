import 'package:flutter/material.dart';
import 'tokens.dart';

/// 家档主题（PRD FR12 外观：深色默认 + 跟随系统/浅色/深色三档）
abstract final class ArkTheme {
  static ThemeData dark() => _build(Brightness.dark);
  static ThemeData light() => _build(Brightness.light);

  static ThemeData _build(Brightness b) {
    final p = ArkColors.palette(b);
    final base = ThemeData(
      brightness: b,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ArkColors.primary,
        brightness: b,
        surface: p.surface,
      ),
      scaffoldBackgroundColor: p.bg,
      extensions: [p],
      splashFactory: InkSparkle.splashFactory,
    );
    return base.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: p.bg,
        foregroundColor: p.text,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: p.text, letterSpacing: -0.2),
      ),
      dividerTheme: DividerThemeData(color: p.divider, thickness: 1, space: 1),
      cardTheme: CardThemeData(color: p.surface, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22), side: BorderSide(color: p.divider))),
      textTheme: TextTheme(
        headlineMedium: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: p.text, letterSpacing: -0.5, height: 1.25),
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: p.text, letterSpacing: -0.3, height: 1.3),
        titleMedium: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: p.text, height: 1.3),
        bodyMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: p.text, height: 1.55),
        bodySmall: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: p.text2, height: 1.5),
        labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: p.text3, height: 1.4),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ArkColors.primary,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(52),
          shape: const StadiumBorder(),
          elevation: 0,
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ArkColors.primary,
          minimumSize: const Size.fromHeight(52),
          side: BorderSide(color: ArkColors.primary.withValues(alpha: 0.5), width: 1.5),
          shape: const StadiumBorder(),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: p.surface,
        selectedItemColor: ArkColors.primary,
        unselectedItemColor: p.text3,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: p.text,
        contentTextStyle: TextStyle(color: p.bg, fontSize: 13),
        behavior: SnackBarBehavior.floating,
        shape: const StadiumBorder(),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: p.surface,
        hintStyle: TextStyle(color: p.text3),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: p.divider)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: ArkColors.primary)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: p.divider)),
      ),
    );
  }
}
