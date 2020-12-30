// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "byProceeding" : MessageLookupByLibrary.simpleMessage("By proceeding, you agree to our Terms of Use and confirm you have read our Privacy Policy."),
    "email" : MessageLookupByLibrary.simpleMessage("Email"),
    "emailHint" : MessageLookupByLibrary.simpleMessage("Your email"),
    "forgotPassword" : MessageLookupByLibrary.simpleMessage("Forgot Password"),
    "invalidEmail" : MessageLookupByLibrary.simpleMessage("Invalid Email"),
    "invalidPassword" : MessageLookupByLibrary.simpleMessage("Invalid Password"),
    "invalidVerificationToken" : MessageLookupByLibrary.simpleMessage("Invalid Verification Token"),
    "password" : MessageLookupByLibrary.simpleMessage("Password"),
    "passwordHint" : MessageLookupByLibrary.simpleMessage("Your password"),
    "resetPassword" : MessageLookupByLibrary.simpleMessage("Reset Password"),
    "signIn" : MessageLookupByLibrary.simpleMessage("Sign In"),
    "signOut" : MessageLookupByLibrary.simpleMessage("Sign Out"),
    "signUp" : MessageLookupByLibrary.simpleMessage("Sign Up"),
    "submitNewPassword" : MessageLookupByLibrary.simpleMessage("Submit New Password"),
    "verificationToken" : MessageLookupByLibrary.simpleMessage("Verification Token"),
    "verifyAccount" : MessageLookupByLibrary.simpleMessage("Verify Account")
  };
}
