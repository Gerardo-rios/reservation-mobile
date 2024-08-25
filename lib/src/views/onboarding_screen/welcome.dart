import 'package:flutter/material.dart';
import 'package:SportSpot/src/constants/constants.dart';
import 'package:SportSpot/src/constants/sizes.dart';
import 'package:SportSpot/src/constants/image_strings.dart';
import 'package:SportSpot/src/constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double height = mediaQuery.size.height;
    final Brightness brightness = mediaQuery.platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor:
            isDarkMode ? Constants.tAppBlackColor : Constants.tAppWhiteColor,
        body: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image(
                  image: const AssetImage(tAppWelcomeScreenImage),
                  height: height * 0.6),
              Column(
                children: <Widget>[
                  Text(
                    tAppWelcomeScreenTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    tWelcomeSubTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () {
                            // Login Redirect
                          },
                          child: Text(tLogin.toUpperCase()))),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            // Register Redirect
                          },
                          child: Text(tRegister.toUpperCase())))
                ],
              )
            ],
          ),
        ));
  }
}
