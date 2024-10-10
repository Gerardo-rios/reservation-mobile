// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'package:sport_spot/src/controllers/settings_controller.dart';
import 'package:sport_spot/src/constants/constants.dart';
import 'package:sport_spot/src/views/login/login_screen.dart';
import 'package:sport_spot/src/views/onboarding_screen/onboarding.dart';
import 'package:sport_spot/src/views/onboarding_screen/welcome.dart';
import 'package:sport_spot/src/views/register/signup_screen.dart';
import 'package:sport_spot/src/views/splash_screen/splash.dart';
import 'package:sport_spot/src/views/home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: settingsController,
        builder: (BuildContext context, Widget? child) => GetMaterialApp(
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
          initialRoute: SplashScreen.routeName,
          getPages: [
            GetPage(name: SplashScreen.routeName, page: () => SplashScreen()),
            GetPage(name: HomeScreen.routeName, page: () => const HomeScreen()),
            GetPage(name: Login.routeName, page: () => const Login()),
            GetPage(name: SignUp.routeName, page: () => const SignUp()),
            GetPage(
                name: WelcomeScreen.routeName,
                page: () => const WelcomeScreen()),
            GetPage(
                name: OnBoardingScreen.routeName,
                page: () => const OnBoardingScreen()),
          ],
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
