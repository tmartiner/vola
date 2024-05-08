import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vola_flutter/src/config/values/colors.dart';
import 'package:vola_flutter/src/config/values/sizes.dart';
import 'package:vola_flutter/src/features/feed_screen/presentation/language_picker.dart';
import 'package:vola_flutter/src/utils/helpers/helper_functions.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key, required this.title});

  final String title;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: isDark
                    ? const ColorFilter.mode(vDarkColor, BlendMode.softLight)
                    : const ColorFilter.mode(vLightColor, BlendMode.softLight),
                fit: BoxFit.cover,
                image: const AssetImage("assets/bg_welcome.jpg"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
            child: Center(
              child: SizedBox(
                height: 280,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/text_logo_bold.svg',
                      colorFilter: isDark
                          ? const ColorFilter.mode(
                              vTertiaryColor, BlendMode.srcIn)
                          : const ColorFilter.mode(
                              vLightColor, BlendMode.srcIn),
                      height: 130,
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Deutsch',
                          textStyle: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                          speed: const Duration(milliseconds: 250),
                        ),
                        TypewriterAnimatedText(
                          'Francais',
                          textStyle: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                          speed: const Duration(milliseconds: 250),
                        ),
                        TypewriterAnimatedText(
                          'Españiol',
                          textStyle: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                          speed: const Duration(milliseconds: 250),
                        ),
                        TypewriterAnimatedText(
                          'English',
                          textStyle: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                          speed: const Duration(milliseconds: 250),
                        ),
                      ],
                      totalRepeatCount: 100,
                      pause: const Duration(milliseconds: 800),
                      displayFullTextOnTap: false,
                      stopPauseOnTap: false,
                    ),
                    const LanguageWidget(
                      navigator: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
