// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:sport_spot/src/controllers/auth_controller.dart';
import 'package:sport_spot/src/views/onboarding_screen/welcome.dart';
import 'package:sport_spot/src/constants/constants.dart';
import 'package:sport_spot/src/constants/text_strings.dart';
import 'package:sport_spot/src/constants/image_strings.dart';
import 'package:sport_spot/src/models/onboarding_widget_model.dart';
import 'package:sport_spot/src/widgets/onboarding_widget.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get find => Get.find();
  final AuthController _authController = Get.find<AuthController>();
  final LiquidController controller = LiquidController();
  RxInt currentPage = 0.obs;

  final List<OnboardingPageWidget> pages = <OnboardingPageWidget>[
    OnboardingPageWidget(
      onboardingModel: OnboardingModel(
        image: tAppOnboardingSearch,
        title: tAppOnboardingTitle1,
        subtitle: tAppOnboardingSubTittle1,
        counterText: tAppOnboardingCounter1,
        bgColor: Constants.tOnBoardingPageSearchColor,
      ),
    ),
    OnboardingPageWidget(
      onboardingModel: OnboardingModel(
        image: tAppOnboardingSelect,
        title: tAppOnboardingTitle2,
        subtitle: tAppOnboardingSubTittle2,
        counterText: tAppOnboardingCounter2,
        bgColor: Constants.tOnBoardingPageSelectColor,
      ),
    ),
    OnboardingPageWidget(
      onboardingModel: OnboardingModel(
        image: tAppOnboardingReserve,
        title: tAppOnboardingTitle3,
        subtitle: tAppOnboardingSubTittle3,
        counterText: tAppOnboardingCounter3,
        bgColor: Constants.tOnBoardingPageReserveColor,
      ),
    ),
  ];

  // ignore: non_constant_identifier_names
  OnPageChangeCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }

  skip(BuildContext context) => {
        _authController.completeOnboarding(),
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const WelcomeScreen()),
        )
      };

  animateToNextSlide(BuildContext context) {
    final int nextPage = controller.currentPage + 1;
    if (nextPage == 3) {
      _authController.completeOnboarding();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const WelcomeScreen()),
      );
      return;
    } else {
      controller.jumpToPage(page: nextPage);
    }
  }
}
