import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SecondScreen extends StatelessWidget {
  final SupabaseClient supabase;

  const SecondScreen({super.key, required this.supabase});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Second Page Content'),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Go to Home Page'),
            ),
          ],
        ),
      ),
    );
  }
}
