import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayScreen extends StatefulWidget {
  const RazorpayScreen({Key? key}) : super(key: key);

  @override
  _RazorpayScreenState createState() => _RazorpayScreenState();
}

class _RazorpayScreenState extends State<RazorpayScreen> {
  static const platform = const MethodChannel("razorpay_flutter");

  // var _razorpay = Razorpay();

  // Razorpay _razorpay = Razorpay();
  Razorpay _razorpay = Razorpay();

  void initstate() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  var options = {
    'key': 'rzp_test_vmA4x7wYfVlNWp',
    'amount': 50000, //in the smallest currency sub-unit.
    'name': 'Test APP NAME',
    'order_id': 'order_NDw7SyFj7PDscZ', // Generate order_id using Orders API
    'description': 'Test Payment',
    'timeout': 60, // in seconds
    'prefill': {'contact': '9990909090', 'email': 'test@random.com'}
  };

  void openCheckout() async {
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print('Payment Success');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print('Payment Failed');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    print('External Wallet');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
        ),
        body: Center(
          child: Column(
            children: [
              const Text('Razorpay Screen'),
              ElevatedButton(
                onPressed: openCheckout,
                child: const Text('Pay Now'),
              ),
            ],
          ),
        ));
  }
}
