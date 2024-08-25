import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SportSpot/src/constants/image_strings.dart';
import 'package:SportSpot/src/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Main Screen'),
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
