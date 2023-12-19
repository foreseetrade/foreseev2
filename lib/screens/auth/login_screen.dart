
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class LoginScreen extends StatefulWidget {
  final SupabaseClient supabase;

  const LoginScreen({super.key, required this.supabase});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
//  late final GotrueClient gotrueClient;

fnLogin() async {

// final gotrueClient = GotrueClient(
//   url: 'https://rlhkgxztxhzpnmrvfojj.supabase.co',
//   asyncStorage: FlutterSecureStorage(), // Or SharedPreferences()
// );

final AuthResponse res = await widget.supabase.auth.signUp(
  email: 'geniwa2260@aseall.com',
  password: 'Test@12345',
  data: {'username': 'testuser'},
);

print('Login response:');
print(res);
final Session? session = res.session;
final User? user = res.user;
print({session, user});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Page Content'),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Go to Home Page'),
            ),
            ElevatedButton(
              onPressed: () => {fnLogin()},
              child: const Text('Login Example'),
            ),
          ],
        ),
      ),
    );
  }
}
