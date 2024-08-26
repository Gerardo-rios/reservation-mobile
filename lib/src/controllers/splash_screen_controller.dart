// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sport_spot/src/wrappers/secure_storage.dart';
import 'package:sport_spot/src/views/home/home_screen.dart';
import 'package:sport_spot/src/models/user_model.dart';
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
    User? user;

    await Future.delayed(const Duration(milliseconds: 1600), () async {
      token = await storage.read(key: SecureStorage.accessTokenKey);
      if (token != null) {
        user = await UserAdapter().fromSecureStorage(
          await storage.readAll(),
        );
        if (user != null) {
          Navigator.pushReplacement(
            // ignore: use_build_context_synchronously
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } else {
          Navigator.pushReplacement(
            // ignore: use_build_context_synchronously
            context,
            MaterialPageRoute(builder: (context) => const WelcomeScreen()),
          );
        }
      } else {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
        );
      }
    });
  }
}
