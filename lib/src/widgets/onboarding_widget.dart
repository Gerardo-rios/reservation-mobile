import 'package:flutter/material.dart';
import 'package:sport_spot/src/models/onboarding_widget_model.dart';
import 'package:sport_spot/src/constants/sizes.dart';

class OnboardingPageWidget extends StatelessWidget {
  const OnboardingPageWidget({
    super.key,
    required this.onboardingModel,
  });

  final OnboardingModel onboardingModel;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(tDefaultSize),
      color: onboardingModel.bgColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image(
              image: AssetImage(onboardingModel.image),
              height: (size.height * 0.49),
            ),
            Column(
              children: <Widget>[
                Text(
                  onboardingModel.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  onboardingModel.subtitle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Text(
              onboardingModel.counterText,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(
              height: size.height * 0.4,
            )
          ],
        ),
      ),
    );
  }
}
