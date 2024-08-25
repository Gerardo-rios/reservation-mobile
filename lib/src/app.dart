import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:SportSpot/src/controllers/settings_controller.dart';
import 'package:SportSpot/src/constants/constants.dart';
import 'package:SportSpot/src/views/splash_screen/splash.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: settingsController,
        builder: (BuildContext context, Widget? child) => MaterialApp(
          restorationScopeId: 'app',
          // ignore: always_specify_types
          localizationsDelegates: const <LocalizationsDelegate>[
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const <Locale>[
            Locale('en', 'US'),
            Locale('es', 'ES'),
          ],
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (BuildContext context) {
            final AppLocalizations? appLocalizations =
                AppLocalizations.of(context);
            return appLocalizations?.appTitle ?? 'Sport Spots';
          },
          theme: Constants.lightTheme,
          darkTheme: Constants.darkTheme,
          themeMode: settingsController.themeMode,
          onGenerateRoute: (RouteSettings routeSettings) =>
              MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) {
              switch (routeSettings.name) {
                default:
                  return SplashScreen();
              }
            },
          ),
        ),
      );
}
