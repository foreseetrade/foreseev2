// api_functions.dart

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_config.dart';

Future<Map<String, dynamic>> fetchData(String apiEndpoint) async {
  final String apiUrl = '${ApiConfig.baseUrl}/$apiEndpoint';

  final response = await http.get(
    Uri.parse(apiUrl),
    headers: await _buildHeaders(),
  );

  return _handleResponse(response);
}

Future<Map<String, dynamic>> postData(
    String apiEndpoint, Map<String, dynamic> data) async {
  final String apiUrl = '${ApiConfig.baseUrl}/$apiEndpoint';

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: await _buildHeaders(),
    body: jsonEncode(data),
  );

  return _handleResponse(response);
}

// Build Headers for a request
Future<Map<String, String>> _buildHeaders() async {
  final String authToken = await _retrieveAuthToken();

  return {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $authToken',
  };
}

// Retrieve dynamic token
Future<String> _retrieveAuthToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? storedToken = prefs.getString('jwtToken');

  if (storedToken != null) {
    return storedToken;
  } else {
    final verifyTokenUrl = '${ApiConfig.baseUrl}/verify-token';
    final verifyTokenResponse = await http.get(Uri.parse(verifyTokenUrl));

    if (verifyTokenResponse.statusCode == 200) {
      final tokenData = json.decode(verifyTokenResponse.body);
      final dynamicToken = tokenData['token'];

      prefs.setString('jwtToken', dynamicToken);

      return dynamicToken;
    } else {
      throw Exception(
          'Failed to retrieve dynamic token. Status Code: ${verifyTokenResponse.statusCode}');
    }
  }
}

Map<String, dynamic> _handleResponse(http.Response response) {
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data. Status Code: ${response.statusCode}');
  }
}
