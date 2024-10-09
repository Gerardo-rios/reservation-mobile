import 'dart:convert';

import 'package:sport_spot/src/services/http_service.dart';
import 'package:http/http.dart' as http;

class HttpWrapper {
  HttpHelperService helperService = HttpHelperService();

  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParams, bool withAccessToken = true}) async {
    final Map<String, String> headers =
        await helperService.buildHeaders(withAccessToken: withAccessToken);

    final http.Response response = await http.get(
      helperService.buildUri(path, queryParameters: queryParams),
      headers: headers,
    );
    return response;
  }

  Future<dynamic> post(String path,
      {Object? body, Encoding? encoding, bool withAccessToken = true}) async {
    final Map<String, String> headers =
        await helperService.buildHeaders(withAccessToken: withAccessToken);

    final http.Response response = await http.post(
      helperService.buildUri(path),
      headers: headers,
      body: body,
      encoding: encoding,
    );
    return response;
  }

  Future<dynamic> put(String path,
      {Object? body, Encoding? encoding, bool withAccessToken = true}) async {
    final Map<String, String> headers =
        await helperService.buildHeaders(withAccessToken: withAccessToken);

    final http.Response response = await http.put(
      helperService.buildUri(path),
      headers: headers,
      body: body,
      encoding: encoding,
    );
    return response;
  }

  Future<dynamic> delete(String path,
      {Object? body, Encoding? encoding, bool withAccessToken = true}) async {
    final Map<String, String> headers =
        await helperService.buildHeaders(withAccessToken: withAccessToken);

    final http.Response response = await http.delete(
      helperService.buildUri(path),
      headers: headers,
      body: body,
      encoding: encoding,
    );
    return response;
  }

  Future<dynamic> patch(String path,
      {Object? body, Encoding? encoding, bool withAccessToken = true}) async {
    final Map<String, String> headers =
        await helperService.buildHeaders(withAccessToken: withAccessToken);

    final http.Response response = await http.patch(
      helperService.buildUri(path),
      headers: headers,
      body: body,
      encoding: encoding,
    );
    return response;
  }
}
