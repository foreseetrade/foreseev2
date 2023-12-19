import 'package:flutter/material.dart';
import 'package:foreseev2/screens/auth/login_screen.dart';
import 'package:foreseev2/screens/home_screen.dart';
import 'package:foreseev2/config/dotenv_config.dart';
import 'package:foreseev2/screens/payment/razorpay_screen.dart';
import 'package:foreseev2/screens/second_screen.dart';

Future<void> main() async {
// void main() {
  WidgetsFlutterBinding.ensureInitialized();
  await loadEnv(); // Load environment variables
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final supabase = initializeSupabase();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foresee V2',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(supabase: supabase),
        '/second': (context) => SecondScreen(supabase: supabase),
        '/login': (context) => LoginScreen(supabase: supabase),
        '/payment':(context) => RazorpayScreen(),
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
// void main() {
//   runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         canvasColor: Color.fromARGB(255, 232, 234, 222),
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late PageController _pageController;
//   int selectedIndex = 0;
//   bool _colorful = false;
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: selectedIndex);
//   }

//   void onButtonPressed(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//     _pageController.animateToPage(selectedIndex,
//         duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           SafeArea(
//               child: SwitchListTile(
//             title: const Text('Colorful Nav bar'),
//             value: _colorful,
//             onChanged: (bool value) {
//               setState(() {
//                 _colorful = !_colorful;
//               });
//             },
//           )),
//           Expanded(
//             child: PageView(
//               physics: const NeverScrollableScrollPhysics(),
//               controller: _pageController,
//               children: _listOfWidget,
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: _colorful
//           ? SlidingClippedNavBar.colorful(
//               backgroundColor: Colors.white,
//               onButtonPressed: onButtonPressed,
//               iconSize: 30,
//               // activeColor: const Color(0xFF01579B),
//               selectedIndex: selectedIndex,
//               barItems: <BarItem>[
//                 BarItem(
//                   icon: Icons.event,
//                   title: 'Events',
//                   activeColor: Colors.blue,
//                   inactiveColor: Colors.orange,
//                 ),
//                 BarItem(
//                   icon: Icons.search_rounded,
//                   title: 'Search',
//                   activeColor: Colors.yellow,
//                   inactiveColor: Colors.green,
//                 ),
//                 BarItem(
//                   icon: Icons.bolt_rounded,
//                   title: 'Energy',
//                   activeColor: Colors.blue,
//                   inactiveColor: Colors.red,
//                 ),
//                 BarItem(
//                   icon: Icons.tune_rounded,
//                   title: 'Settings',
//                   activeColor: Colors.cyan,
//                   inactiveColor: Colors.purple,
//                 ),
//               ],
//             )
//           : SlidingClippedNavBar(
//               backgroundColor: Colors.white,
//               onButtonPressed: onButtonPressed,
//               iconSize: 30,
//               activeColor: const Color(0xFF01579B),
//               selectedIndex: selectedIndex,
//               barItems: <BarItem>[
//                 BarItem(
//                   icon: Icons.event,
//                   title: 'Events',
//                 ),
//                 BarItem(
//                   icon: Icons.search_rounded,
//                   title: 'Search',
//                 ),
//                 BarItem(
//                   icon: Icons.bolt_rounded,
//                   title: 'Energy',
//                 ),
//                 BarItem(
//                   icon: Icons.tune_rounded,
//                   title: 'Settings',
//                 ),
//               ],
//             ),
//     );
//   }
// }

// // icon size:24 for fontAwesomeIcons
// // icons size: 30 for MaterialIcons

// List<Widget> _listOfWidget = <Widget>[
//   Container(
//     alignment: Alignment.center,
//     child: const Icon(
//       Icons.event,
//       size: 56,
//       color: Colors.brown,
//     ),
//   ),
//   Container(
//     alignment: Alignment.center,
//     child: const Icon(
//       Icons.search,
//       size: 56,
//       color: Colors.brown,
//     ),
//   ),
//   Container(
//     alignment: Alignment.center,
//     child: const Icon(
//       Icons.bolt,
//       size: 56,
//       color: Colors.brown,
//     ),
//   ),
//   Container(
//     alignment: Alignment.center,
//     child: const Icon(
//       Icons.tune_rounded,
//       size: 56,
//       color: Colors.brown,
//     ),
//   ),
// ];