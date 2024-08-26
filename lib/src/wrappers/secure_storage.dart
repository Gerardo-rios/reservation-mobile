import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sport_spot/src/models/user_model.dart';

class SecureStorage {
  static String accessTokenKey = 'access_token';
  static User user = User(
      email: '',
      name: '',
      username: '',
      token: '',
      address: '',
      phone: '',
      photo: '',
      role: '');

  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  static final FlutterSecureStorage storage = FlutterSecureStorage(
    aOptions: _getAndroidOptions(),
  );
}
