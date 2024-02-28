// api_endpoints/api_1.dart

import 'package:foreseev2/apis/api_functions.dart';

Future<Map<String, dynamic>> apiGetAllMatches() async {
  return fetchData('match/all');
}

Future<Map<String, dynamic>> postDataApi1(Map<String, dynamic> data) async {
  return postData('api1/endpoint', data);
}
