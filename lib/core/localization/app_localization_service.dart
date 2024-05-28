import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'languages/ar.dart';
import 'languages/en.dart';

class AppLocalizationService extends Translations {
  /// fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('en', 'US');

  /// Needs to be same order with language
  static const locales = [
    Locale('ar', 'SA'),
    Locale('en', 'US'),
  ];

  /// Keys and their translations
  /// Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'ar_SA': arSU,
      };
}
