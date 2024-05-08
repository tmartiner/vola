import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vola_flutter/src/app.dart';
import 'package:vola_flutter/src/data/locals/i18n.dart';
import 'package:vola_flutter/src/serverpod_client.dart';

void main() async {
  // Need to call this as SessionManager is using Flutter bindings before App is called.
  WidgetsFlutterBinding.ensureInitialized();
  await initializeServerpodClient();

// Need to call the languages before App is called.
  await EasyLocalization.ensureInitialized();

// -- Overcome from transparent spaces at the bottom in iOS full Mode
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.top],
  );

// -- Statusbar text changed to white for eveery screen
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  runApp(
    EasyLocalization(
      supportedLocales: I18n.all,
      path: "assets/translations",
      fallbackLocale: const Locale('en'),
      child: const App(),
    ),
  );
}
