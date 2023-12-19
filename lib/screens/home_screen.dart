// ignore_for_file: prefer_single_quotes

import "package:flutter/material.dart";
import 'package:foreseev2/screens/auth/login_screen.dart';
import 'package:foreseev2/screens/payment/razorpay_screen.dart';
import 'package:foreseev2/screens/second_screen.dart';
import "package:supabase_flutter/supabase_flutter.dart";


class HomeScreen extends StatefulWidget {
  final SupabaseClient supabase;

   const HomeScreen({super.key, required this.supabase});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Page Content'),
            ElevatedButton(
              onPressed: () {
                // Navigate to the second page on button click
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(supabase: widget.supabase),
                  ),
                );
              },
              child: const Text('Go to Second Page'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the second page on button click
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(supabase: widget.supabase),
                  ),
                );
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Payment page on button click
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RazorpayScreen(),
                  ),
                );
              },
              child: const Text('Payment Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
