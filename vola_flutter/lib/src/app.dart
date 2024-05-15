import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:vola_flutter/src/config/values/color_theme.dart';
import 'package:vola_flutter/src/config/values/route/route_handler.dart';
import 'package:vola_flutter/src/features/feed_screen/presentation/feed_screen.dart';
import 'package:vola_flutter/src/features/signin/presentation/signin_screen.dart';
import 'package:vola_flutter/src/features/welcome/presentation/welcome_screen.dart';
import 'package:vola_flutter/src/data/serverdata/serverpod_client.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool isFirstTime = true;

  @override
  void initState() {
    super.initState();
    // Make sure that we rebuild the page if signed in status changes.
    sessionManager.addListener(() {
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isFirstTime) {
      // Überprüfe, ob dies der erste Start der App ist
      setState(() {
        isFirstTime = !sessionManager.isSignedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Vola',
        theme: themeDataLight(isDarkTheme: false, context: context),
        darkTheme: themeDataDark(isDarkTheme: true, context: context),
        themeMode: ThemeMode.system,
        onGenerateRoute: generateRoute,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: isFirstTime
            ? const WelcomeScreen(title: "")
            : sessionManager.isSignedIn
                ? const FeedScreen(title: 'feed_title')
                : const SignInPage(title: ""),
      );
}
