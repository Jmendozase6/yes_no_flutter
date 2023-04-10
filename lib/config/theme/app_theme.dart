import 'package:flutter/material.dart';

/// This class is used to store the app theme

const Color customColor = Color(0xFF49149F);

/// Colors for the app
const List<Color> _colorThemes = [
  customColor,
  Colors.blueAccent,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;
  final Brightness brightness;

  /// We check if the selected color is between 0 and the length of the list
  AppTheme({
    required this.brightness,
    this.selectedColor = 0,
  }) : assert(
          selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
          'Colors must be between 0 and ${_colorThemes.length}',
        );

  ThemeData theme() {
    /// We return the ThemeData with the selected color
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      brightness: brightness,
    );
  }
}
