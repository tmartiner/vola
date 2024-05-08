import 'package:dash_flags/dash_flags.dart';
import 'package:flutter/material.dart';

class I18n {
  static final all = [
    const Locale('en'),
    const Locale('es'),
    const Locale('fr'),
    const Locale('de'),
  ];

  static Widget getFlag(String code, context) {
    switch (code) {
      case 'en':
        return Column(
          children: [
            LanguageFlag(
              language: Language.en, // OR Language.fromCode('ar')
              height: 15,
            ),
            Text(
              'UK',
              style: TextStyle(
                fontSize: 9.5,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        );
      case 'es':
        return Column(
          children: [
            LanguageFlag(
              language: Language.es, // OR Language.fromCode('ar')
              height: 15,
            ),
            Text(
              'ES',
              style: TextStyle(
                fontSize: 9.5,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        );
      case 'fr':
        return Column(
          children: [
            LanguageFlag(
              language: Language.fr, // OR Language.fromCode('ar')
              height: 15,
            ),
            Text(
              'FR',
              style: TextStyle(
                fontSize: 9.5,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        );
      case 'de':
        return Column(
          children: [
            LanguageFlag(
              language: Language.de, // OR Language.fromCode('ar')
              height: 15,
            ),
            Text(
              'DE',
              style: TextStyle(
                fontSize: 9.5,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        );
      default:
        return LanguageFlag(
          language: Language.en, // OR Language.fromCode('ar')
          height: 15,
        );
    }
  }
}
