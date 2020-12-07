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
      desc: 'No Items Available',
      locale: locale.toString(),
    );
  }

  String noBootstrapsAvailable() {
    return Intl.message(
      'No Bootstraps Available',
      name: 'noBootstrapsAvailable',
      desc: 'No Bootstraps Available',
      locale: locale.toString(),
    );
  }

  String selectBootstrap() {
    return Intl.message(
      'Select Bootstrap',
      name: 'selectBootstrap',
      desc: 'Select Bootstrap',
      locale: locale.toString(),
    );
  }
}
