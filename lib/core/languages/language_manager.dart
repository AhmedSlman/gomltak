import 'package:flutter/material.dart';

enum LanguageType { english, arabic }

class LanguageManager {
  static const String arabic = 'ar';
  static const String english = 'en';
  static const Locale arabicLocale = Locale('ar', '');
  static const Locale englishLocale = Locale('en', '');
  static const String pathLocalization = 'assets/lang';
  static const List<Locale> listLanguageLocale = [arabicLocale, englishLocale];
}
