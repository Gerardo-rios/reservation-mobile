// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_spot/src/controllers/auth_controller.dart';
import 'package:sport_spot/src/views/home/home_screen.dart';
import 'package:sport_spot/src/views/onboarding_screen/onboarding.dart';
import 'package:sport_spot/src/views/onboarding_screen/welcome.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find<SplashScreenController>();
  final AuthController _authController = Get.find<AuthController>();
  RxBool animate = false.obs;

  Future<void> startAnimation(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 1500));

    await Future.delayed(const Duration(milliseconds: 1600), () async {
      await _authController.checkAuthStatus();
      await _authController.checkOnboardingStatus();

      if (_authController.isAuthenticated &&
          _authController.hasCompletedOnboarding) {
        Get.offAll(() => const HomeScreen());
      } else if (!_authController.isAuthenticated &&
          _authController.hasCompletedOnboarding) {
        Get.offAll(() => const WelcomeScreen());
      } else {
        Get.offAll(() => const OnBoardingScreen());
      }
    });
  }
}
