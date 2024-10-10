import 'package:get/get.dart';
import 'package:sport_spot/src/controllers/auth_controller.dart';
import 'package:sport_spot/src/models/auth_model.dart';
import 'package:sport_spot/src/services/auth/login.dart';
import 'package:sport_spot/src/wrappers/exception_handler.dart';

class LoginController extends GetxController {
  static LoginController get find => Get.find();
  RxBool isObscure = true.obs;
  final AuthController _authController = Get.find<AuthController>();

  login(String userEmail, String userPassword) async {
    if (userEmail.isNotEmpty && userPassword.isNotEmpty) {
      if (!GetUtils.isEmail(userEmail)) {
        return Get.snackbar('Error', 'Please, enter a valid email');
      }
      try {
        final AuthUser? userLogged =
            await loginRequest(userEmail, userPassword);
        if (userLogged != null) {
          _authController.login(userLogged.token, userLogged.account);
        }
      } on Exception catch (e) {
        handleException(e);
      }
    } else {
      return Get.snackbar('Error', 'Please, fill all fields');
    }
  }
}
