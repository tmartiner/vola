import 'package:dash_flags/dash_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:vola_flutter/src/utils/helpers/helper_functions.dart';

class I18n {
  static final List<Locale> allLocales = [
    const Locale('en'),
    const Locale('es'),
    const Locale('fr'),
    const Locale('de'),
  ];
}

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final Widget icon;
}

abstract class MenuItems {
  static List<MenuItem> firstItems = [english, french, spanish, german];
  static List<MenuItem> secondItems = [mode];

  static final english = MenuItem(
    text: 'UK',
    icon: LanguageFlag(
      language: Language.en,
      height: 15,
    ),
  );
  static final french = MenuItem(
    text: 'FR',
    icon: LanguageFlag(
      language: Language.fr,
      height: 15,
    ),
  );
  static final spanish = MenuItem(
    text: 'ES',
    icon: LanguageFlag(
      language: Language.es,
      height: 15,
    ),
  );
  static final german = MenuItem(
    text: 'DE',
    icon: LanguageFlag(
      language: Language.de,
      height: 15,
    ),
  );
  static const mode = MenuItem(
    text: 'MODE',
    icon: Icon(IconsaxPlusBroken
        .sun_1), // Placeholder icon, will be replaced during build
  );

  static Widget buildItem(MenuItem item, BuildContext context) {
    if (item == mode) {
      final isDark = VHelperFunctions.isDarkMode(context);
      final icon = isDark
          ? Icon(
              IconsaxPlusBroken.sun_1,
              size: 18,
              color: Theme.of(context).colorScheme.secondary,
            )
          : Icon(
              IconsaxPlusBroken.moon,
              size: 18,
              color: Theme.of(context).colorScheme.secondary,
            );
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: icon,
          ),
          Text(
            item.text,
            style: TextStyle(
              fontSize: 9.5,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: item.icon,
          ),
          Expanded(
            child: Text(
              item.text,
              style: TextStyle(
                fontSize: 9.5,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      );
    }
  }

  static void onChanged(BuildContext context, MenuItem item) {
    if (item == english ||
        item == french ||
        item == spanish ||
        item == german) {
      Get.updateLocale(context.locale);
    } else if (item == mode) {
      Get.changeThemeMode(
        Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
      );
    }
  }
}
