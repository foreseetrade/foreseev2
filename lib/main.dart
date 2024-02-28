import 'package:flutter/material.dart';
import 'package:foreseev2/components/loaders/circular_loader.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foreseev2/screens/auth/otpless_screen.dart';
import 'package:foreseev2/screens/home_screen.dart';
import 'package:foreseev2/screens/main/app_screen.dart';
import 'package:foreseev2/screens/payment/razorpay_screen.dart';
import 'package:foreseev2/screens/permissions/bluetooth_screen.dart';
import 'package:heroicons/heroicons.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await fnRequestBluetoothPermissions();
  // await dotenv.load();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<void> initialization = _loadData();

  static Future<void> _loadData() async {
    // Add any other asynchronous initialization here
    // Example: await someAsyncInitialization();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foresee V2',
      home: FutureBuilder(
        future: initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AppWrapper();
          } else {
            return const CircularLoader(); // Show a loading screen while initializing
          }
        },
      ),
      initialRoute: '/',
      routes: {
        // '/': (context) => const AppContent(),
        '/payment': (context) => const RazorpayScreen(),
        '/optlesslogin': (context) => const OtplessScreen(),
        '/home': (context) => const HomeScreen(),
        // '/wallet': (context) => WalletScreen(),
        // '/profile': (context) => ProfileScreen(),
      },
    );
  }
}

// class AppContent extends StatefulWidget {
//   const AppContent({super.key});

//   @override
//   _AppContentState createState() => _AppContentState();
// }

// class _AppContentState extends State<AppContent> {
//   int _bottomNavIndex = 0;
//   int visit = 0;
//   double height = 30;
//   Color colorSelect = const Color(0XFF0686F8);
//   Color color = const Color(0XFF7AC0FF);
//   Color color2 = const Color(0XFF96B1FD);
//   Color bgColor = const Color(0XFF1752FE);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: const HomeScreen(),
//       bottomNavigationBar: Container(
//           padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
//           child: BottomNavigationBar(
//             items: const [
//               BottomNavigationBarItem(
//                 icon: HeroIcon(
//                   HeroIcons.home,
//                   size: 16,
//                 ),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: HeroIcon(
//                   HeroIcons.wallet,
//                   size: 16,
//                 ),
//                 label: 'Wallet',
//               ),
//               BottomNavigationBarItem(
//                 icon: HeroIcon(
//                   HeroIcons.user,
//                   size: 16,
//                 ),
//                 label: 'Profile',
//               ),
//             ],
//           )),
//     );
//   }
// }
