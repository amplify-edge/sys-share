import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Translations {
  Locale locale;

  String signUpForAccount() {
    return Intl.message(
      'Sign up for your account',
      name: 'signUpForAccount',
      desc: 'Sign up for your account',
      locale: locale.toString(),
    );
  }

  String emailAddress() {
    return Intl.message(
      'Email Address Addressory',
      name: 'emailAddress',
      desc: 'Email Address',
      locale: locale.toString(),
    );
  }

  String needProtonMail() {
    return Intl.message(
      'Need a protonmail ?',
      name: 'needProtonMail',
      desc: 'Need a protonmail ?',
      locale: locale.toString(),
    );
  }

  String explainWhy() {
    return Intl.message(
      'Explain why?',
      name: 'explainWhy',
      desc: 'Explain why?',
      locale: locale.toString(),
    );
  }

  String password() {
    return Intl.message(
      'Password',
      name: 'password',
      desc: 'Password',
      locale: locale.toString(),
    );
  }

  String passwordStrength() {
    return Intl.message(
      'Your password should be a minimum of 8 of characters and use at least three of the four available character types: lowercase letters, uppercase letters, numbers, and symbols.',
      name: 'passwordStrength',
      desc:
          'Your password should be a minimum of 8 of characters and use at least three of the four available character types: lowercase letters, uppercase letters, numbers, and symbols.',
      locale: locale.toString(),
    );
  }

  String passwordAgain() {
    return Intl.message(
      'Password Again',
      name: 'passwordAgain',
      desc: 'Password Again',
      locale: locale.toString(),
    );
  }

  String meetOthersSharedInterest() {
    return Intl.message(
      'Meet others with shared interests?',
      name: 'meetOthersSharedInterest',
      desc: 'Meet others with shared interests?',
      locale: locale.toString(),
    );
  }

  String yes() {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: 'Yes',
      locale: locale.toString(),
    );
  }

  String no() {
    return Intl.message(
      'No',
      name: 'no',
      desc: 'No',
      locale: locale.toString(),
    );
  }

  String civilDisobedienceTraining() {
    return Intl.message(
      'I have civil disobedience training',
      name: 'civilDisobedienceTraining',
      desc: 'I have civil disobedience training',
      locale: locale.toString(),
    );
  }

  String setupNotificationChannel() {
    return Intl.message(
      'Setup notification channel',
      name: 'setupNotificationChannel',
      desc: 'Setup notification channel',
      locale: locale.toString(),
    );
  }

  String email() {
    return Intl.message(
      'Email',
      name: 'email',
      desc: 'Email',
      locale: locale.toString(),
    );
  }

  String appMessaging() {
    return Intl.message(
      'App Messaging',
      name: 'appMessaging',
      desc: 'App Messaging',
      locale: locale.toString(),
    );
  }

  String signUp() {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: 'Sign Up',
      locale: locale.toString(),
    );
  }

  String privacyPolicy() {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: 'Privacy Policy',
      locale: locale.toString(),
    );
  }

  String whyProtonMail() {
    return Intl.message(
      'Why ProtonMail ?',
      name: 'whyProtonMail',
      desc: 'Why ProtonMail ?',
      locale: locale.toString(),
    );
  }

  String protonMailExplanation() {
    return Intl.message(
      'ProtonMail to ProtonMail emails are considered to be secure by Information Security professionals. They’re both free to use on Android and Apple smart phones and Windows and Mac computers.',
      name: 'protonMailExplanation',
      desc:
          'ProtonMail to ProtonMail emails are considered to be secure by Information Security professionals. They’re both free to use on Android and Apple smart phones and Windows and Mac computers.',
      locale: locale.toString(),
    );
  }

  // import 'package:mod_account/core/core.dart';
  //
}
