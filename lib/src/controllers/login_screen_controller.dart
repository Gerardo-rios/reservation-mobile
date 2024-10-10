import 'package:get/get.dart';
import 'package:sport_spot/src/models/auth_model.dart';
import 'package:sport_spot/src/services/auth/login.dart';
import 'package:sport_spot/src/views/home/home_screen.dart';
import 'package:sport_spot/src/wrappers/exception_handler.dart';
import 'package:sport_spot/src/wrappers/secure_storage.dart';

class LoginController extends GetxController {
  static LoginController get find => Get.find();
  RxBool isObscure = true.obs;

  login(String userEmail, String userPassword) async {
    if (userEmail.isNotEmpty && userPassword.isNotEmpty) {
      if (!GetUtils.isEmail(userEmail)) {
        return Get.snackbar('Error', 'Please, enter a valid email');
      }
      try {
        final AuthUser? userLogged =
            await loginRequest(userEmail, userPassword);
        if (userLogged != null) {
          await SecureStorage.storage.write(
              key: SecureStorage.accessTokenKey, value: userLogged.token);
          await SecureStorage.storage.write(
              key: SecureStorage.authUserKey, value: userLogged.account);
          Get.to(const HomeScreen());
        }
      } on Exception catch (e) {
        handleException(e);
      }
    } else {
      return Get.snackbar('Error', 'Please, fill all fields');
    }
  }
}
