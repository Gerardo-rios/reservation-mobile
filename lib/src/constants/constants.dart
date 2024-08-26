import 'package:flutter/material.dart';
import 'package:sport_spot/src/constants/theme.dart';

class Constants {
  // App
  static String appName = 'Sport Spot';

  static ThemeData lightTheme = FieldsAppTheme.lightTheme;

  static ThemeData darkTheme = FieldsAppTheme.darkTheme;

  //App Constant Colors
  static Color tOnBoardingPageReserveColor =
      const Color.fromARGB(255, 143, 169, 216);
  static Color tOnBoardingPageSelectColor =
      const Color.fromARGB(255, 128, 121, 121);
  static Color tOnBoardingPageSearchColor =
      const Color.fromARGB(255, 136, 196, 139);

  static Color tAppPrimaryColor = const Color.fromARGB(255, 203, 195, 207);
  static Color tAppSecondaryColor = const Color.fromARGB(255, 119, 116, 116);

  static Color tAppWhiteColor = const Color.fromARGB(255, 247, 235, 235);
  static Color tAppBlackColor = const Color.fromARGB(255, 88, 88, 88);
}
