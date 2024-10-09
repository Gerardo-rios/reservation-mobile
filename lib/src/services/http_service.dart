import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sport_spot/src/config/environment.dart';
import 'package:sport_spot/src/wrappers/secure_storage.dart';

class HttpHelperService {
  final String _host = Environment.apiHost;
  final String _scheme = Environment.apiScheme;
  final String _apiPart = Environment.apiPart;
  late String? _accessToken;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Uri buildUri(String path, {Map<String, dynamic>? queryParameters}) {
    queryParameters ??= <String, dynamic>{};
    if (_scheme == 'http') {
      return Uri.http(_host, '$_apiPart$path', queryParameters);
    } else {
      return Uri.https(_host, '$_apiPart$path', queryParameters);
    }
  }

  Future<Map<String, String>> buildHeaders({bool? withAccessToken}) async {
    final Map<String, String> headers = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    if (withAccessToken == true) {
      _accessToken = (await _storage.read(key: SecureStorage.accessTokenKey));
      if (_accessToken != null) {
        headers['Authorization'] = 'Bearer $_accessToken';
        return headers;
      }
    }

    return headers;
  }

  static isSuccessfullyResponse(int statusCode) =>
      statusCode >= 200 && statusCode < 300;

  static isRedirectResponse(int statusCode) =>
      statusCode >= 300 && statusCode < 400;

  static isClientErrorResponse(int statusCode) =>
      statusCode >= 400 && statusCode < 500;

  static isServerErrorResponse(int statusCode) => statusCode >= 500;
}
