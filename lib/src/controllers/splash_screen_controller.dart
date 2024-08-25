// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:reservation_fields_app/src/wrappers/secure_storage.dart';
import 'package:reservation_fields_app/src/views/home/home_screen.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find<SplashScreenController>();
  RxBool animate = false.obs;
  FlutterSecureStorage storage = SecureStorage.storage;

  Future startAnimation(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 3000));

    late String? token;
    late Map<String, String>? user;

    await Future.delayed(const Duration(milliseconds: 3100), () async {
      token = await storage.read(key: SecureStorage.accessTokenKey);
      if (token != null) {
        user = await storage.readAll();
        if (user != null) {
          Get.offAll(() => const HomeScreen());
        } else {
          // Go to welcome screen
        }
      } else {
        // Go to onboarding screen
      }
    });
  }
}
