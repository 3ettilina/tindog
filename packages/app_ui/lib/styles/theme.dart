import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData get light => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: _textTheme,
        bottomNavigationBarTheme: _navBarTheme,
      );

  static TextTheme get _textTheme => GoogleFonts.wellfleetTextTheme();

  static BottomNavigationBarThemeData get _navBarTheme =>
      BottomNavigationBarThemeData(
        selectedLabelStyle: _textTheme.bodyLarge,
        unselectedLabelStyle: _textTheme.bodyLarge,
      );
}
