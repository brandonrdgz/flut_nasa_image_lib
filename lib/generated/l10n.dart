// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Flut NASA Image Library`
  String get appTitle {
    return Intl.message(
      'Flut NASA Image Library',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `No images available`
  String get emptyImagesList {
    return Intl.message(
      'No images available',
      name: 'emptyImagesList',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeDrawerSection {
    return Intl.message(
      'Home',
      name: 'homeDrawerSection',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favoritesDrawerSection {
    return Intl.message(
      'Favorites',
      name: 'favoritesDrawerSection',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favoritesPageTitle {
    return Intl.message(
      'Favorites',
      name: 'favoritesPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `You dont't have any favorites`
  String get emptyFavoritesList {
    return Intl.message(
      'You dont\'t have any favorites',
      name: 'emptyFavoritesList',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get snackBarRetry {
    return Intl.message(
      'Retry',
      name: 'snackBarRetry',
      desc: '',
      args: [],
    );
  }

  /// `Server error`
  String get serverError {
    return Intl.message(
      'Server error',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `Network error. Try again later`
  String get networkError {
    return Intl.message(
      'Network error. Try again later',
      name: 'networkError',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected error`
  String get generalError {
    return Intl.message(
      'Unexpected error',
      name: 'generalError',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es', countryCode: 'ES'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
