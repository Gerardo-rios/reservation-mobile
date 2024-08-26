import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_spot/src/constants/image_strings.dart';
import 'package:sport_spot/src/constants/text_strings.dart';
import 'package:sport_spot/src/constants/sizes.dart';
import 'package:sport_spot/src/controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashScreenController splashController =
      Get.put(SplashScreenController());

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    splashController.startAnimation(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Obx(() => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: splashController.animate.value ? 0 : -30,
              left: splashController.animate.value ? 0 : -30,
              child: const Image(
                image: AssetImage(tSplashTopIcon),
                height: 130,
              ))),
          Obx(() => AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                top: 130,
                left: splashController.animate.value ? tDefaultSize : -80,
                child: AnimatedOpacity(
                  duration: const Duration(microseconds: 1600),
                  opacity: splashController.animate.value ? 1 : 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        tAppName,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        tAppTag,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              )),
          Obx(() => AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                bottom:
                    splashController.animate.value ? (size.height * 0.2) : 0,
                left: (size.width * 0.08),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  opacity: splashController.animate.value ? 1 : 0,
                  child: const Image(
                    image: AssetImage(tSplashImage),
                    height: 200,
                  ),
                ),
              )),
          Obx(() => AnimatedPositioned(
                duration: const Duration(milliseconds: 2400),
                bottom: splashController.animate.value ? 40 : 0,
                right: tDefaultSize,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  opacity: splashController.animate.value ? 1 : 0,
                  child: Container(
                    width: tSplashContainerSize,
                    height: tSplashContainerSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.lightGreen,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
