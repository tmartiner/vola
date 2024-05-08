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

class SignInPage extends StatefulWidget {
  const SignInPage({super.key, required this.title});

  final String title;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.all(Sizes.p12),
              height: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
              width: double.infinity,
              padding: const EdgeInsets.all(Sizes.p12),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: Sizes.p80,
                    ),
                    Text(
                      'welcometext'.tr(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    const SizedBox(
                      height: Sizes.p64,
                    ),
                    SignInWithEmailButton(
                      icon: Icon(
                        IconsaxPlusBroken.sms_tracking,
                        size: Sizes.p32,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      label: Text(
                        vFieldEmail,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
          Positioned(
            left: 0,
            right: 0,
            top: 180,
            child: SvgPicture.asset(
              'assets/logo_crow_final_bold.svg',
              colorFilter: isDark
                  ? const ColorFilter.mode(vSecondaryColor, BlendMode.srcIn)
                  : const ColorFilter.mode(vTertiaryColor, BlendMode.srcIn),
              height: 130,
            ),
          ),
          const Positioned(
            right: 12,
            top: 232,
            child: LanguageWidget(),
          ),
        ],
      ),
    );
  }
}
