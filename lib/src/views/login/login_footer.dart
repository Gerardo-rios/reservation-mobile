import 'package:flutter/material.dart';
import 'package:sport_spot/src/constants/text_strings.dart';
import 'package:sport_spot/src/views/register/signup_screen.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    // ignore: always_specify_types
                    MaterialPageRoute(
                        builder: (BuildContext context) => const SignUp()));
              },
              child: Text.rich(TextSpan(
                  text: tDontHaveAnAccount,
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: const <InlineSpan>[
                    TextSpan(
                        text: tMakeARegister,
                        style: TextStyle(color: Colors.blue))
                  ])))
        ],
      );
}
