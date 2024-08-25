import 'package:SportSpot/src/models/user_model.dart';

class UserAdapter {
  Future<User> fromSecureStorage(Map<String, String> secureStoreData) async =>
      User(
        token: secureStoreData['token']!,
        name: secureStoreData['name']!,
        email: secureStoreData['email']!,
        username: secureStoreData['username']!,
        role: secureStoreData['role']!,
        phone: secureStoreData['phone']!,
        address: secureStoreData['address']!,
        photo: secureStoreData['photo']!,
      );
}
