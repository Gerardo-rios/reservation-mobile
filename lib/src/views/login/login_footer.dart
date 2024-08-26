import 'package:flutter/material.dart';
import 'package:sport_spot/src/constants/text_strings.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          TextButton(
              onPressed: () {
                // TODO: Navigate to Register Screen
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
