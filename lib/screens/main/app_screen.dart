import 'package:flutter/material.dart';
import 'package:foreseev2/aesthitics/aesthitics.dart';
import 'package:foreseev2/main.dart';
import 'package:foreseev2/screens/home_screen.dart';
import 'package:heroicons/heroicons.dart';

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  _AppWrapperState createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() {
    switch (_bottomNavIndex) {
      case 0:
        return HomeScreen();
      case 1:
      // return WalletScreen();
      case 2:
      // return ProfileScreen();
      default:
        return HomeScreen();
    }
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
      child: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        selectedItemColor: AppColors.vPurple,
        unselectedItemColor: AppColors.vGray,
        backgroundColor: AppColors.vLight,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });

          // Navigate to the selected screen using named routes
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/wallet');
              break;
            case 2:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: HeroIcon(
              HeroIcons.home,
              size: 16,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: HeroIcon(
              HeroIcons.wallet,
              size: 16,
            ),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: HeroIcon(
              HeroIcons.user,
              size: 16,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
