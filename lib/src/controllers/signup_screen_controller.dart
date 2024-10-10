import 'package:get/get.dart';
import 'package:sport_spot/src/services/auth/register.dart';
import 'package:sport_spot/src/views/login/login_screen.dart';
import 'package:sport_spot/src/wrappers/exception_handler.dart';

class SignUpController extends GetxController {
  static SignUpController get find => Get.find();
  RxBool isObscure = true.obs;

  register(String name, String email, String password, String user,
      String photo, String phone, String address) async {
    if (name.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        user.isNotEmpty &&
        photo.isNotEmpty &&
        phone.isNotEmpty &&
        address.isNotEmpty) {
      if (!GetUtils.isEmail(email)) {
        return Get.snackbar('Error', 'Please, enter a valid email');
      }
      try {
        final Map<String, dynamic>? userRegistered = await registerRequest(
            name, email, password, user, photo, phone, address);
        if (userRegistered != null) {
          Get.snackbar('Success', 'User registered successfully');
          Get.offAll(() => const Login());
        }
      } on Exception catch (e) {
        handleException(e);
      }
    }
  }
}
