import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_spot/src/constants/sizes.dart';
import 'package:sport_spot/src/constants/text_strings.dart';
import 'package:sport_spot/src/controllers/login_screen_controller.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    late String email = '';
    late String password = '';
    return Form(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person_outline_outlined),
              labelText: tEmail,
              hintText: tEmail,
              border: OutlineInputBorder(),
            ),
            onChanged: (String value) {
              email = value;
            },
          ),
          const SizedBox(
            height: tFormHeight - 20,
          ),
          Obx(
            () => TextFormField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.fingerprint),
                  labelText: tPassword,
                  hintText: tPassword,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(loginController.isObscure.value
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      loginController.isObscure.value =
                          !loginController.isObscure.value;
                    },
                  )),
              obscureText: loginController.isObscure.value,
              enableSuggestions: false,
              onChanged: (String value) {
                password = value;
              },
            ),
          ),
          const SizedBox(
            height: tFormHeight - 20,
          ),
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    //TODO: Forgot password logic
                  },
                  child: const Text(tForgotPassword))),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  loginController.login(email, password);
                },
                child: Text(tLogin.toUpperCase())),
          ),
        ],
      ),
    ));
  }
}
