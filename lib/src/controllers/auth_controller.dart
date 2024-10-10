import 'package:get/get.dart';
import 'package:sport_spot/src/views/home/home_screen.dart';
import 'package:sport_spot/src/views/onboarding_screen/welcome.dart';
import 'package:sport_spot/src/wrappers/secure_storage.dart';

class AuthController extends GetxController {
  final RxBool _isAuthenticated = false.obs;
  final RxBool _hasCompletedOnboarding = false.obs;

  bool get isAuthenticated => _isAuthenticated.value;
  bool get hasCompletedOnboarding => _hasCompletedOnboarding.value;

  Future<void> checkAuthStatus() async {
    //TODO: Check if the user is authenticated in backend
    final String? token =
        await SecureStorage.storage.read(key: SecureStorage.accessTokenKey);
    final String? account =
        await SecureStorage.storage.read(key: SecureStorage.authUserKey);

    _isAuthenticated.value = token != null;
    _hasCompletedOnboarding.value = account != null;
  }

  Future<void> checkOnboardingStatus() async {
    final String? onboardingStatus =
        await SecureStorage.storage.read(key: SecureStorage.onboardingKey);
    _hasCompletedOnboarding.value = onboardingStatus == 'completed';
  }

  Future<void> login(String token, String account) async {
    await SecureStorage.storage
        .write(key: SecureStorage.accessTokenKey, value: token);
    await SecureStorage.storage
        .write(key: SecureStorage.authUserKey, value: account);
    _isAuthenticated.value = true;
    _hasCompletedOnboarding.value = true;
    Get.offAll(() => const HomeScreen());
  }

  Future<void> logout() async {
    await SecureStorage.storage.delete(key: SecureStorage.accessTokenKey);
    await SecureStorage.storage.delete(key: SecureStorage.authUserKey);
    _isAuthenticated.value = false;
    _hasCompletedOnboarding.value = false;
    Get.offAll(() => const WelcomeScreen());
  }

  Future<void> completeOnboarding() async {
    _hasCompletedOnboarding.value = true;
    await SecureStorage.storage
        .write(key: SecureStorage.onboardingKey, value: 'completed');
  }
}
