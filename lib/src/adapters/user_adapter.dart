import 'package:sport_spot/src/models/auth_model.dart';

class AuthUserAdapter {
  Future<AuthUser> fromSecureStorage(String token, String account) async =>
      AuthUser(
        token: token,
        account: account,
      );
}
