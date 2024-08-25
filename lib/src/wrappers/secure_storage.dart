import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:SportSpot/src/models/user_model.dart';

class SecureStorage {
  static late String accessTokenKey;
  static late User user;

  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  static final FlutterSecureStorage storage = FlutterSecureStorage(
    aOptions: _getAndroidOptions(),
  );
}
