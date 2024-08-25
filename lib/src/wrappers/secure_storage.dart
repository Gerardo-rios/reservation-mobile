import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const String accessTokenKey = '';
  static const Map<String, String> user = <String, String>{};

  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  static final FlutterSecureStorage storage = FlutterSecureStorage(
    aOptions: _getAndroidOptions(),
  );
}
