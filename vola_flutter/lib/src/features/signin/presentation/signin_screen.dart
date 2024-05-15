import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vola_flutter/src/config/values/colors.dart';
import 'package:vola_flutter/src/config/values/sizes.dart';
import 'package:vola_flutter/src/features/feed_screen/presentation/settings_picker.dart';
import 'package:vola_flutter/src/features/signin/presentation/widgets/signin_button.dart';
import 'package:vola_flutter/src/data/serverdata/serverpod_client.dart';
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
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: isDark ? bgDarkGradient : bgLightGradient,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.p12,
              ),
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: 52, bottom: 30, left: 8, right: 8),
                    decoration: BoxDecoration(
                      // color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        SimpleShadow(
                          opacity: 0.6,
                          color: isDark
                              ? Theme.of(context).colorScheme.onSecondary
                              : Theme.of(context).colorScheme.onTertiary,
                          offset: const Offset(0, 6),
                          sigma: 7,
                          child: Container(
                            height: 440,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer
                                  .withOpacity(0.8),
                            ),
                            padding: const EdgeInsets.all(Sizes.p12),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Spacer(),
                                  Expanded(
                                    child: Text(
                                      'welcometext'.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                          ),
                                    ),
                                  ),
                                  SignInEmailButton(caller: client.modules.auth)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: SettingsPicker(
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
                  ),
                  Positioned(
                    left: 116,
                    right: 116,
                    top: -4,
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
                            ? const ColorFilter.mode(
                                vSecondaryColor, BlendMode.srcIn)
                            : const ColorFilter.mode(
                                vTertiaryColor, BlendMode.srcIn),
                        height: 130,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
