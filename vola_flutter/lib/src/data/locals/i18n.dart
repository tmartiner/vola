import 'package:dash_flags/dash_flags.dart';
import 'package:flutter/material.dart';

class I18n {
  static final all = [
    const Locale('en'),
    const Locale('es'),
    const Locale('fr'),
    const Locale('de'),
  ];

  static Widget getFlag(String code) {
    switch (code) {
      case 'en':
        return LanguageFlag(
          language: Language.en, // OR Language.fromCode('ar')
          height: 15,
        );
      case 'es':
        return LanguageFlag(
          language: Language.es, // OR Language.fromCode('ar')
          height: 15,
        );
      case 'fr':
        return LanguageFlag(
          language: Language.fr, // OR Language.fromCode('ar')
          height: 15,
        );
      case 'de':
        return LanguageFlag(
          language: Language.de, // OR Language.fromCode('ar')
          height: 15,
        );
      default:
        return LanguageFlag(
          language: Language.en, // OR Language.fromCode('ar')
          height: 15,
        );
    }
  }
}
