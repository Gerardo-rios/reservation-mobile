import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  // ignore: non_constant_identifier_names
  static String _get_environment_value(String key, String? defaultValue) =>
      defaultValue != null
          ? dotenv.get(key)
          : dotenv.get(key, fallback: defaultValue);

  static String get apiHost =>
      _get_environment_value('API_URL', 'HOST not found');

  static String get apiScheme => _get_environment_value('API_SCHEMA', 'http');

  static String get apiPart => _get_environment_value('API_PART', '');
}
