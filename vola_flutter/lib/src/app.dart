import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:vola_flutter/src/config/values/color_theme.dart';
import 'package:vola_flutter/src/features/feed_screen/presentation/feed_screen.dart';
import 'package:vola_flutter/src/features/signin/presentation/signin_screen.dart';
import 'package:vola_flutter/src/features/welcome/presentation/welcome_screen.dart';
import 'package:vola_flutter/src/serverpod_client.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Vola',
        theme: themeDataLight(isDarkTheme: false, context: context),
        darkTheme: themeDataDark(isDarkTheme: true, context: context),
        themeMode: ThemeMode.system,
        //onGenerateRoute: generateRoute,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: sessionManager.isSignedIn
            ? const WelcomeScreen(title: "")
            //SignInPage(title: "")
            : FeedScreen(
                title: 'feed_title'.tr(),
              ),
      );
}
