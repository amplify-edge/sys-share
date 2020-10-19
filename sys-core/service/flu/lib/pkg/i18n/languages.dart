import 'package:flutter/material.dart';

class Languages {
  static Map<String, String> supportedLanguages = {
    'en': 'English',
    'fr': 'French',
    'de': 'German',
    'es': 'Spanish',
    'it': 'Italian',
    'ur': 'Urdu',
  };

  static List<Locale> getLocales() {
    List<Locale> _locales = [];

    Languages.supportedLanguages.forEach((key, value) {
      _locales.add(Locale(key));
    });

    return _locales;
  }
}
