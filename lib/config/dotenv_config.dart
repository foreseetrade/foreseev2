import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

late String supabaseUrl;
late String supabaseKey;

Future<void> loadEnv() async {
  if (dotenv.env['dotenv_filename'] != '') {
    await dotenv.load(fileName: 'assets/.env');
  }

  supabaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
  supabaseKey = dotenv.env['SUPABASE_KEY'] ?? '';
}

SupabaseClient initializeSupabase() {
  return SupabaseClient(supabaseUrl, supabaseKey);
}
