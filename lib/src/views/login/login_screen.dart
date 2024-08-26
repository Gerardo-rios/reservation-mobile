import 'package:flutter/material.dart';
import 'package:sport_spot/src/constants/image_strings.dart';
import 'package:sport_spot/src/constants/sizes.dart';
import 'package:sport_spot/src/constants/text_strings.dart';
import 'package:sport_spot/src/widgets/forms/form_header_widget.dart';
import 'package:sport_spot/src/views/login/login_form.dart';
import 'package:sport_spot/src/views/login/login_footer.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                        image: tAppWelcomeScreenImage,
                        title: tLoginTitle,
                        subTitle: tLoginSubtitle),
                    LoginFormWidget(),
                    LoginFooterWidget(),
                  ]),
            ),
          ),
        ),
      );
}
