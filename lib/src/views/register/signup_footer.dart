import 'package:flutter/material.dart';
import 'package:sport_spot/src/constants/text_strings.dart';
import 'package:sport_spot/src/views/login/login_screen.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
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
                        builder: (BuildContext context) => const Login()));
              },
              child: Text.rich(TextSpan(children: <InlineSpan>[
                TextSpan(
                    text: tAlreadyHaveAnAccount,
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(text: tLogin.toUpperCase())
              ])))
        ],
      );
}
