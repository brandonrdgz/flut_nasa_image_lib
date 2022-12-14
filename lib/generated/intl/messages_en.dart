// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appTitle":
            MessageLookupByLibrary.simpleMessage("Flut NASA Image Library"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "emptyFavoritesList": MessageLookupByLibrary.simpleMessage(
            "You dont\'t have any favorites"),
        "emptyImagesList":
            MessageLookupByLibrary.simpleMessage("No images available"),
        "favoritesDrawerSection":
            MessageLookupByLibrary.simpleMessage("Favorites"),
        "favoritesPageTitle": MessageLookupByLibrary.simpleMessage("Favorites"),
        "gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
        "generalError":
            MessageLookupByLibrary.simpleMessage("Unexpected error"),
        "homeDrawerSection": MessageLookupByLibrary.simpleMessage("Home"),
        "networkError": MessageLookupByLibrary.simpleMessage(
            "Network error. Try again later"),
        "serverError": MessageLookupByLibrary.simpleMessage("Server error"),
        "snackBarRetry": MessageLookupByLibrary.simpleMessage("Retry")
      };
}
