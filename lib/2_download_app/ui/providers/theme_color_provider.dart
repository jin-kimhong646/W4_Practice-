import 'package:flutter/material.dart';

enum ThemeColor {
  blue(color: Color.fromARGB(255, 125, 178, 247)),
  pink(color: Color.fromARGB(255, 229, 158, 221)),
  green(color: Color.fromARGB(255, 156, 202, 8));

  const ThemeColor({required this.color});

  final Color color;
  Color get backgroundColor => color.withAlpha(100);
}

// ThemeColor currentThemeColor = ThemeColor.blue;

class ColorChangingNotifier extends ChangeNotifier {
  ThemeColor _themeColor = ThemeColor.pink;

  ThemeColor get themeColor => _themeColor;

  void colorChanging(ThemeColor newColor) {
    _themeColor = newColor;
    notifyListeners();
  }
}
