import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {

  ThemeMode currentTheme = ThemeMode.light;
  String currentLocal = 'en';


  changeTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  changeLanguage(String newLanguage) {
    if (currentLocal == newLanguage) return;
    currentLocal = newLanguage;
    notifyListeners();
  }

  bool isDark() => currentTheme == ThemeMode.dark;

  String bgImage() =>
      isDark() ? 'assets/images/dark_bg.png' : 'assets/images/default_bg.png';

  String splashImage() =>
      isDark() ? 'assets/images/logo_dark.png' : 'assets/images/logo2.png';

  String headSebhaImage() =>
      isDark() ? 'assets/images/head_sebha_dark.png'
      : 'assets/images/head_sebha_logo.png';

  String bodySebhaImage() =>
      isDark() ? 'assets/images/body_sebha_dark.png'
          : 'assets/images/body_sebha_logo.png';

  Color splashBgColor() => isDark()
      ? const Color(0xFF141A2E)
      : const Color.fromRGBO(234, 227, 211, 1.0);

  Color toggle() =>
      isDark() ? const Color(0xFFFACC1D) : const Color(0xFFB7935F);

  Color containerColor() => isDark()
      ? const Color(0xFF141A2E).withOpacity(0.9)
      : const Color(0xFFF8F8F8).withOpacity(0.8);
}
