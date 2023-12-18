// With prefix (optional)
import 'dart:io' as io;

import 'package:supabase_flutter/supabase_flutter.dart';

String? supabaseUrl;
String? supabaseKey;

Future<void> loadEnv() async {
  // if (dotenv.env['dotenv_filename'] != '') {
  //   await dotenv.load(fileName: 'assets/.env');
  // }

  // supabaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
  // supabaseKey = dotenv.env['SUPABASE_KEY'] ?? '';

  supabaseUrl =  io.Platform.environment['SUPABASE_URL'];
  supabaseKey =  io.Platform.environment['SUPABASE_KEY'];
}

SupabaseClient initializeSupabase() {
  return SupabaseClient(supabaseUrl!, supabaseKey!);
}
