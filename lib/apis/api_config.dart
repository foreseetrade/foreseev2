import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  // static String baseUrl = dotenv.env['BE_URL'] ?? '';
  static String get baseUrl => dotenv.env['BE_URL'] ?? '';

}
