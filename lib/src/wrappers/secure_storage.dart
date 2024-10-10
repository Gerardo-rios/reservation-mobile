import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static String accessTokenKey = 'access_token';
  static String authUserKey = 'auth_user';
  static String onboardingKey = 'onboarding';

  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  static final FlutterSecureStorage storage = FlutterSecureStorage(
    aOptions: _getAndroidOptions(),
  );
}
