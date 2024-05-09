import 'package:dash_flags/dash_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Importiere Get-Paket
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:vola_flutter/src/utils/helpers/helper_functions.dart';

class LanguageController extends GetxController {
  var selectedLanguage = 'en'.obs; // Standardmäßig auf Englisch setzen

  void changeLanguage(String languageCode) {
    selectedLanguage.value = languageCode;
    // Setze die ausgewählte Sprache
    EasyLocalization.of(Get.context!)!
        .setLocale(Locale(languageCode))
        .then((value) => Get.updateLocale(Get.context!.locale));
  }
}

class I18n {
  static final List<Locale> allLocales = [
    const Locale('en'),
    const Locale('fr'),
    const Locale('es'),
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
      height: 20,
    ),
  );
  static final french = MenuItem(
    text: 'FR',
    icon: LanguageFlag(
      language: Language.fr,
      height: 20,
    ),
  );
  static final spanish = MenuItem(
    text: 'ES',
    icon: LanguageFlag(
      language: Language.es,
      height: 20,
    ),
  );
  static final german = MenuItem(
    text: 'DE',
    icon: LanguageFlag(
      language: Language.de,
      height: 20,
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
              fontSize: 10,
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
                fontSize: 10,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      );
    }
  }

  static void onChanged(BuildContext context, MenuItem item) {
    final languageController = Get.put(
        LanguageController()); // Erstellt und fügt den LanguageController in das GetX-System ein
    if (item == english) {
      languageController.changeLanguage(I18n.allLocales[0].toString());
    } else if (item == french) {
      languageController.changeLanguage(I18n.allLocales[1].toString());
    } else if (item == spanish) {
      languageController.changeLanguage(I18n.allLocales[2].toString());
    } else if (item == german) {
      languageController.changeLanguage(I18n.allLocales[3].toString());
    } else if (item == mode) {
      Get.changeThemeMode(
        Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
      );
    }
  }
}
