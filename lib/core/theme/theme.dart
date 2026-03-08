import 'package:flutter/material.dart';

const List<Color> _colorThemes = [
  Color.fromARGB(255, 22, 31, 169),
  Colors.blue,
  Colors.red,
  Colors.yellow,
  Colors.lightGreen,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
    : assert(
        selectedColor >= 0 && selectedColor <= _colorThemes.length,
        'Color > 0  and < ${_colorThemes.length}',
      );

  Color get colorTheme => _colorThemes[selectedColor];

  ThemeData themeData() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      appBarTheme: AppBarTheme(
        backgroundColor: _colorThemes[selectedColor],
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        centerTitle: false,
      ),
      brightness: Brightness.dark,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
