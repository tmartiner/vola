import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:vola_flutter/src/config/values/colors.dart';
import 'package:vola_flutter/src/config/values/route/router.dart';
import 'package:vola_flutter/src/config/values/sizes.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigationRoutes().pushReplacement(context, "signUp");
        },
        child: Icon(
          IconsaxPlusBroken.arrow_right_3,
          size: Sizes.p32,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
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
              child: SvgPicture.asset(
                'assets/text_logo_bold.svg',
                colorFilter: isDark
                    ? const ColorFilter.mode(vTertiaryColor, BlendMode.srcIn)
                    : const ColorFilter.mode(vLightColor, BlendMode.srcIn),
                height: 130,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
