// ignore_for_file: prefer_single_quotes

import "package:flutter/material.dart";
import 'package:foreseev2/components/cards/match_card.dart';
import 'package:foreseev2/screens/auth/otpless_screen.dart';
import 'package:foreseev2/screens/payment/razorpay_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

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
            // const MatchCard(),
            const Text('Home Page Content'),
            // ElevatedButton(
            //   onPressed: () {
            //     // Navigate to the second page on button click
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => SecondScreen(),
            //       ),
            //     );
            //   },
            //   child: const Text('Go to Second Page'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     // Navigate to the Payment page on button click
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => RazorpayScreen(),
            //       ),
            //     );
            //   },
            //   child: const Text('Payment Screen'),
            // ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Payment page on button click
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtplessScreen(),
                  ),
                );
              },
              child: const Text('OTPLESS Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
