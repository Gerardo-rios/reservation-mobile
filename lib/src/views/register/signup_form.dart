import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_spot/src/controllers/photo_picker_controller.dart';
import 'package:sport_spot/src/controllers/signup_screen_controller.dart';
import 'package:sport_spot/src/constants/sizes.dart';
import 'package:sport_spot/src/constants/text_strings.dart';
import 'package:sport_spot/src/widgets/photo_picker_widget.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SignUpController registerController = Get.put(SignUpController());
    final PhotoPickerController photoController =
        Get.put(PhotoPickerController());
    late String name = '';
    late String email = '';
    late String phoneNumber = '';
    late String password = '';
    late String username = '';
    String? photoPath = photoController.imagePath.value;
    late String address = '';
    const String roleName = 'user';
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                label: Text(tFullName),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
              onChanged: (String value) => <String>{
                name = value,
              },
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(tEmail),
                prefixIcon: Icon(Icons.email_outlined),
              ),
              onChanged: (String value) => <String>{
                email = value,
              },
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(tPhoneNo),
                prefixIcon: Icon(Icons.numbers),
              ),
              onChanged: (String value) => <String>{
                phoneNumber = value,
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
                      icon: Icon(registerController.isObscure.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        registerController.isObscure.value =
                            !registerController.isObscure.value;
                      },
                    )),
                obscureText: registerController.isObscure.value,
                enableSuggestions: false,
                onChanged: (String value) {
                  password = value;
                },
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(tUsername),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
              onChanged: (String value) => <String>{
                username = value,
              },
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            const PhotoPickerWidget(),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(tAddress),
                prefixIcon: Icon(Icons.location_on_outlined),
              ),
              onChanged: (String value) => <String>{
                address = value,
              },
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    // TODO: Register Logic
                  },
                  child: Text(tRegister.toUpperCase())),
            )
          ],
        ),
      ),
    );
  }
}
