import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    const seed = Color(0xFF2952CC);

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: seed),
      scaffoldBackgroundColor: const Color(0xFFF7F8FC),
      cardTheme: const CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
      ),
      chipTheme: ChipThemeData.fromDefaults(
        secondaryColor: seed,
        brightness: Brightness.light,
        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  static ThemeData dark() {
    const seed = Color(0xFF7DA2FF);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seed,
        brightness: Brightness.dark,
      ),
    );
  }
}