import 'package:flutter/material.dart';
import 'package:sport_spot/src/constants/constants.dart';
import 'package:sport_spot/src/constants/sizes.dart';
import 'package:sport_spot/src/constants/image_strings.dart';
import 'package:sport_spot/src/constants/text_strings.dart';
import 'package:sport_spot/src/views/login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const String routeName = '/welcome';

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
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                // ignore: always_specify_types
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const Login()));
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
