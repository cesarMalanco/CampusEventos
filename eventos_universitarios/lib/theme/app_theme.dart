import 'package:flutter/material.dart';

// La clase AppTheme guarda la configuración visual de la aplicación
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFA31F34)),
      scaffoldBackgroundColor: const Color(0xFFF5F6FA),
      appBarTheme: const AppBarTheme(centerTitle: false, elevation: 0),
      cardTheme: const CardThemeData(elevation: 2, margin: EdgeInsets.zero),
    );
  }
}
