import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:vola_flutter/src/data/locals/i18n.dart';
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
      child: DropdownButton2(
        alignment: Alignment.center,
        customButton: Icon(
          IconsaxPlusBroken.setting_2,
          size: 30,
          color: isDark
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.primary,
        ),
        items: [
          ...MenuItems.firstItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              alignment: Alignment.center,
              child: MenuItems.buildItem(item, context),
            ),
          ),
          const DropdownMenuItem<Divider>(enabled: false, child: Divider()),
          ...MenuItems.secondItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              alignment: Alignment.center,
              child: MenuItems.buildItem(item, context),
            ),
          ),
        ],
        onChanged: (value) {
          MenuItems.onChanged(context, value! as MenuItem);
        },
        dropdownStyleData: DropdownStyleData(
          width: 58,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isDark
                ? Theme.of(context).colorScheme.tertiary
                : Theme.of(context).colorScheme.tertiary,
          ),
          offset: const Offset(-14, -4),
        ),
        menuItemStyleData: MenuItemStyleData(
          customHeights: [
            ...List<double>.filled(MenuItems.firstItems.length, 46),
            8,
            ...List<double>.filled(MenuItems.secondItems.length, 50),
          ],
          padding: const EdgeInsets.only(left: 12, right: 12),
        ),
      ),
    );
  }
}
