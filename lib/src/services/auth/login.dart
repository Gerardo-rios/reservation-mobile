import 'dart:async';
import 'dart:convert';
import 'package:sport_spot/src/models/auth_model.dart';
import 'package:sport_spot/src/services/http_service.dart';
import 'package:sport_spot/src/wrappers/http_wrapper.dart';

HttpWrapper http = HttpWrapper();

Future<AuthUser?> loginRequest(String email, String password) async {
  final Map<String, String> params = <String, String>{
    'email': email,
    'password': password
  };
  final dynamic response = await http.post('/account/login',
      body: json.encode(params), withAccessToken: false);
  if (!HttpHelperService.isSuccessfullyResponse(response!.statusCode)) {
    throw Exception(response.body);
  }
  return AuthUser.fromJson(jsonDecode(response.body));
}
