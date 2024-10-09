import 'package:flutter/material.dart';
import 'package:sport_spot/src/constants/sizes.dart';
import 'package:sport_spot/src/constants/text_strings.dart';
import 'package:sport_spot/src/widgets/forms/form_header_widget.dart';
import 'package:sport_spot/src/views/register/signup_form.dart';
import 'package:sport_spot/src/views/register/signup_footer.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  static const String routeName = '/register';

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FormHeaderWidget(
                      title: tRegisterTitle, subTitle: tRegisterSubtitle),
                  SignUpFormWidget(),
                  SignUpFooterWidget()
                ],
              ),
            ),
          ),
        ),
      );
}
