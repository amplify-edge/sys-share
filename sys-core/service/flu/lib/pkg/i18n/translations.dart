import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Translations {
  Locale locale;

  String search() {
    return Intl.message(
      'Search',
      name: 'search',
      desc: 'search',
      locale: locale.toString(),
    );
  }

  String noItemsAvailable() {
    return Intl.message(
      'No Items Available',
      name: 'noItemsAvailable',
      desc: 'noItemsAvailable',
      locale: locale.toString(),
    );
  }
}