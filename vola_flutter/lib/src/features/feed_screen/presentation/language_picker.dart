import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:vola_flutter/src/data/locals/i18n.dart';
import 'package:vola_flutter/src/features/signin/presentation/signin_screen.dart';

class LanguageWidget extends StatefulWidget {
  final bool navigator;
  const LanguageWidget({super.key, required this.navigator});

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<Locale>(
        value: context.locale,
        icon: null,
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
        onChanged: (_) {
          Get.updateLocale(context.locale);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SignInPage(title: ""),
            ),
          );
        },
      ),
    );
  }
}
