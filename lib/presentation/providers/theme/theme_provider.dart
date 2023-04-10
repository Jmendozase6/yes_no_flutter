import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  int _selectedColor = 0;
  Brightness _brightness = Brightness.light;

  int get selectedColor => _selectedColor;
  Brightness get brightness => _brightness;

  /// This method updates the selected color just adding 1 to the current value
  void updateColor() {
    /// If the current value is less than 6, add 1, otherwise, set it to 0
    _selectedColor < 6 ? _selectedColor++ : _selectedColor = 0;
    notifyListeners();
  }

  /// This method updates the selected color just adding 1 to the current value
  void updateBrightness() {
    /// If the current brighness is light, set it to dark, otherwise, set it to light
    _brightness == Brightness.light
        ? _brightness = Brightness.dark
        : _brightness = Brightness.light;
    notifyListeners();
  }

  Icon getIconByTheme() {
    return _brightness == Brightness.light
        ? const Icon(Icons.dark_mode)
        : const Icon(Icons.light_mode);
  }
}
