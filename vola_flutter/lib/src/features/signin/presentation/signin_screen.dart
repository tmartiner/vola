import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:vola_flutter/src/config/values/colors.dart';
import 'package:vola_flutter/src/config/values/sizes.dart';
import 'package:vola_flutter/src/config/values/text_strings.dart';
import 'package:vola_flutter/src/features/feed_screen/presentation/language_picker.dart';
import 'package:vola_flutter/src/serverpod_client.dart';
import 'package:vola_flutter/src/utils/helpers/helper_functions.dart';
import 'package:simple_shadow/simple_shadow.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key, required this.title});

  final String title;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isNavigator = false;

  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: isDark ? bgDarkGradient : bgLightGradient,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                // margin: const EdgeInsets.symmetric(horizontal: Sizes.p12),
                height: 440,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context)
                      .colorScheme
                      .secondaryContainer
                      .withOpacity(0.8),
                  boxShadow: [
                    BoxShadow(
                      color: isDark
                          ? vSecondaryColor.withOpacity(0.6)
                          : vSecondaryColor.withOpacity(0.4),
                      offset: const Offset(0, 6),
                      blurRadius: 10,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(Sizes.p12),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Spacer(),
                      const Spacer(),
                      Text(
                        'welcometext'.tr(),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                      const Spacer(),
                      SignInWithEmailButton(
                        icon: Icon(
                          IconsaxPlusBroken.sms_tracking,
                          size: Sizes.p32,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        label: Text(
                          vFieldEmail,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(vPrimaryColor),
                        ),
                        caller: client.modules.auth,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 130,
            right: 130,
            top: 150,
            child: SimpleShadow(
              opacity: 0.6,
              color: isDark
                  ? Theme.of(context).colorScheme.onSecondary
                  : Theme.of(context).colorScheme.onTertiary,
              offset: const Offset(0, 6),
              sigma: 7,
              child: SvgPicture.asset(
                'assets/logo_crow_final_bold.svg',
                colorFilter: isDark
                    ? const ColorFilter.mode(vSecondaryColor, BlendMode.srcIn)
                    : const ColorFilter.mode(vTertiaryColor, BlendMode.srcIn),
                height: 130,
              ),
            ),
          ),
          Positioned(
            right: 12,
            top: 216,
            child: LanguageWidget(
              navigator: isNavigator,
              updateNavigator: (value) {
                setState(() {
                  isNavigator = value; // Aktualisiere den Wert
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
