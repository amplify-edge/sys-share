import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Translations {
  Locale locale;

  // Dialogs
  String email() {
    return Intl.message(
      'Email',
      name: 'email',
      desc: 'Email',
      locale: locale.toString(),
    );
  }

  String emailHint() {
    return Intl.message(
      'Your email',
      name: 'emailHint',
      desc: 'Your Email',
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

  String passwordHint() {
    return Intl.message(
      'Your password',
      name: 'passwordHint',
      desc: 'Your Password',
      locale: locale.toString(),
    );
  }

  String verificationToken() {
    return Intl.message(
      'Verification Token',
      name: 'verificationToken',
      desc: 'Verification Token',
      locale: locale.toString(),
    );
  }

  String verifyAccount() {
    return Intl.message(
      'Verify Account',
      name: 'verifyAccount',
      desc: 'Verifiy Account',
      locale: locale.toString(),
    );
  }

  String submitNewPassword() {
    return Intl.message(
      'Submit New Password',
      name: 'submitNewPassword',
      desc: 'Submit New Password',
      locale: locale.toString(),
    );
  }

  String byProceeding() {
    return Intl.message(
      'By proceeding, you agree to our Terms of Use and confirm you have read our Privacy Policy.',
      name: 'byProceeding',
      desc: 'By Proceeding',
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

  String signIn() {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: 'Sign In',
      locale: locale.toString(),
    );
  }

  String signOut() {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
      desc: 'Sign Out',
      locale: locale.toString(),
    );
  }

  String forgotPassword() {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPassword',
      desc: 'Forgot Password',
      locale: locale.toString(),
    );
  }

  String resetPassword() {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: 'Reset Password',
      locale: locale.toString(),
    );
  }

  String invalidEmail() {
    return Intl.message(
      'Invalid Email',
      name: 'invalidEmail',
      desc: 'Invalid Email',
      locale: locale.toString(),
    );
  }

  String invalidPassword() {
    return Intl.message(
      'Invalid Password',
      name: 'invalidPassword',
      desc: 'Invalid Password',
      locale: locale.toString(),
    );
  }

  String invalidVerificationToken() {
    return Intl.message(
      'Invalid Verification Token',
      name: 'invalidVerificationToken',
      desc: 'Invalid Verification Token',
      locale: locale.toString(),
    );
  }
}
