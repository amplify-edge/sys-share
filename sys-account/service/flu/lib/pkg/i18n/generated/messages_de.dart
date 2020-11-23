// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "byProceeding" : MessageLookupByLibrary.simpleMessage("Indem Sie fortfahren, stimmen Sie unseren Nutzungsbedingungen zu und bestätigen, dass Sie unsere Datenschutzrichtlinie gelesen haben."),
    "email" : MessageLookupByLibrary.simpleMessage("Email"),
    "forgotPassword" : MessageLookupByLibrary.simpleMessage("Passwort vergessen"),
    "invalidPassword" : MessageLookupByLibrary.simpleMessage("Ungültiges Passwort"),
    "password" : MessageLookupByLibrary.simpleMessage("Passwort"),
    "resetPassword" : MessageLookupByLibrary.simpleMessage("Passwort zurücksetzen"),
    "signIn" : MessageLookupByLibrary.simpleMessage("Einloggen"),
    "signUp" : MessageLookupByLibrary.simpleMessage("Anmelden"),
    "submitNewPassword" : MessageLookupByLibrary.simpleMessage("Neues Passwort senden"),
    "verificationToken" : MessageLookupByLibrary.simpleMessage("Bestätigungstoken"),
    "verifyAccount" : MessageLookupByLibrary.simpleMessage("Konto überprüfen")
  };
}
