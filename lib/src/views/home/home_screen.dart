import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_spot/src/constants/image_strings.dart';
import 'package:sport_spot/src/constants/sizes.dart';
import 'package:sport_spot/src/controllers/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: authController.logout,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              tAppLogo,
              width: tDefaultSize * 0.5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/welcome');
              },
              child: const Text('Go to Welcome Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
