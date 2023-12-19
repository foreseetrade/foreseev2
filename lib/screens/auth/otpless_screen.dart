import 'package:flutter/material.dart';
import 'package:foreseev2/screens/permissions/bluetooth_screen.dart';
import 'package:otpless_flutter/otpless_flutter.dart';

// Assuming _otplessFlutterPlugin initialization and import

class OtplessScreen extends StatefulWidget {
  const OtplessScreen({super.key});

  @override
  _OtplessScreenState createState() => _OtplessScreenState();
}

class _OtplessScreenState extends State<OtplessScreen> {
  String message = '';

  // Function to trigger OTPless authentication
  void triggerOTPlessAuthentication() async {
    await fnRequestBluetoothPermissions();
    final otplessFlutterPlugin = Otpless();
    var extra = {
      'method': 'get',
      'params': {'cid': 'DAT76FJ2I4BZY5QZ4J3N18LVEX0BBM96'}
    };

    otplessFlutterPlugin.openLoginPage((result) {
      if (result['data'] != null) {
        final token = result['data']['token'];
        message = 'token: $token';
        // Handle token retrieval or further operations here
        print('OTPless message:');
        print(message);
      } else {
        message = result['errorMessage'];
        // Handle error message here
      }
      // You can update the UI based on the result if needed
      setState(() {
        // Update UI or variables based on the result
        message = message;
      });
    }, jsonObject: extra);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login with OTPless'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // Trigger OTPless authentication when the button is pressed
                triggerOTPlessAuthentication();
              },
              child: const Text('One Tap Login'),
            ),
            Text(message),
          ],
        ),
      ),
    );
  }
}
