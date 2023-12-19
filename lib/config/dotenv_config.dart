import 'package:supabase_flutter/supabase_flutter.dart';

String? supabaseUrl;
String? supabaseKey;

Future<void> loadEnv() async {
  // if (dotenv.env['dotenv_filename'] != '') {
  //   await dotenv.load(fileName: 'assets/.env');
  // }

  // supabaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
  // supabaseKey = dotenv.env['SUPABASE_KEY'] ?? '';

  // supabaseUrl =  io.Platform.environment['SUPABASE_URL'];
  // supabaseKey =  io.Platform.environment['SUPABASE_KEY'];

  supabaseUrl = 'https://rlhkgxztxhzpnmrvfojj.supabase.co';
  supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJsaGtneHp0eGh6cG5tcnZmb2pqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI1NzE1MDAsImV4cCI6MjAxODE0NzUwMH0.ND890DdH5SeRzcvwMs6zrSZK0jUTU5DARwFwxEwB_Gw';
}

SupabaseClient initializeSupabase() {
  return SupabaseClient(supabaseUrl!, supabaseKey!);
}

  // // Initialize Supabase using your Supabase URL and anonymous key
  // final supabase = SupabaseAuth(
  //   supabaseUrl, supabaseKey,
  //   autoRefreshToken: true, // Optionally, enable token auto-refresh
  // );

  // // Initialize async storage for Supabase
  // supabase.setStorage(SupabaseLocalStorage(
  //   'your_supabase_storage_key', // Replace with your storage key
  // ));
