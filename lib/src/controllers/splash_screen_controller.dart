// ignore_for_file: always_specify_types, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sport_spot/src/models/auth_model.dart';
import 'package:sport_spot/src/wrappers/secure_storage.dart';
import 'package:sport_spot/src/views/home/home_screen.dart';
import 'package:sport_spot/src/adapters/user_adapter.dart';
import 'package:sport_spot/src/views/onboarding_screen/onboarding.dart';
import 'package:sport_spot/src/views/onboarding_screen/welcome.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find<SplashScreenController>();
  RxBool animate = false.obs;
  FlutterSecureStorage storage = SecureStorage.storage;

  Future startAnimation(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 1500));

    String? token;
    String? account;

    await Future.delayed(const Duration(milliseconds: 1600), () async {
      token = await storage.read(key: SecureStorage.accessTokenKey);
      account = await storage.read(key: SecureStorage.authUserKey);
      //TODO: Implement token validation when backend ready
      if (token != null) {
        if (account != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const WelcomeScreen()),
          );
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
        );
      }
    });
  }
}
