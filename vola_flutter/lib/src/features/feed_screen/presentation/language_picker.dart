import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vola_flutter/src/data/locals/i18n.dart';
import 'package:vola_flutter/src/features/signin/presentation/signin_screen.dart';
import 'package:vola_flutter/src/utils/helpers/helper_functions.dart';

class LanguageWidget extends StatefulWidget {
  final bool navigator;
  final Function(bool) updateNavigator;
  const LanguageWidget({
    super.key,
    required this.navigator,
    required this.updateNavigator,
  });

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);

    return DropdownButtonHideUnderline(
      child: DropdownButton<Locale>(
        dropdownColor: isDark
            ? Theme.of(context).colorScheme.tertiary
            : Theme.of(context).colorScheme.tertiary,
        value: context.locale,
        borderRadius: BorderRadius.circular(20),
        icon: const SizedBox(
          width: 12,
        ),
        items: I18n.all.map(
          (locale) {
            final flag = I18n.getFlag(locale.languageCode, context);

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
        onChanged: (locale) {
          if (locale != null) {
            Get.updateLocale(context.locale);
            if (widget.navigator) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignInPage(title: ""),
                ),
              );
            } else {
              // Nichts tun
            }
          }
        },
      ),
    );
  }
}
