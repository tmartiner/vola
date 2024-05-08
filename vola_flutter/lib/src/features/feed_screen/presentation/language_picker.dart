import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vola_flutter/src/data/locals/i18n.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<Locale>(
        value: context.locale,
        icon: Container(
          width: 12,
        ),
        items: I18n.all.map(
          (locale) {
            final flag = I18n.getFlag(locale.languageCode);

            return DropdownMenuItem(
              value: locale,
              onTap: () {
                context.setLocale(locale);
              },
              child: Container(
                child: flag,
              ),
            );
          },
        ).toList(),
        onChanged: (_) {},
      ),
    );
  }
}
