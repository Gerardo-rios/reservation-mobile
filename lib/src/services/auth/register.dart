import 'dart:async';
import 'dart:convert';
import 'package:sport_spot/src/services/http_service.dart';
import 'package:sport_spot/src/wrappers/http_wrapper.dart';

HttpWrapper http = HttpWrapper();

Future<Map<String, dynamic>?> registerRequest(
    String name,
    String email,
    String password,
    String user,
    String photo,
    String phone,
    String address) async {
  final Map<String, String> params = <String, String>{
    'name': name,
    'email': email,
    'password': password,
    'user': user,
    'photo': photo,
    'phone': phone,
    'address': address,
    'role_name': 'user'
  };
  final dynamic response = await http.post('/account/create',
      body: json.encode(params), withAccessToken: false);
  if (!HttpHelperService.isSuccessfullyResponse(response!.statusCode)) {
    throw Exception(response.body);
  }
  return jsonDecode(response.body);
}
