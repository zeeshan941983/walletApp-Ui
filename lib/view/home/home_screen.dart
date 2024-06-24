import 'package:flutter/material.dart';

import 'package:pocket_io/constrants/widgets/bottom_navigation.dart';
import 'package:pocket_io/view/notificationScreen/notification_Screen.dart';
import 'package:pocket_io/view/profile_screen/profile_screen.dart';
import 'package:pocket_io/view/settings_screen/settings_screen.dart';

import 'package:pocket_io/view/status/status_screen.dart';

import 'package:pocket_io/view/walletScreen/wallet_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Stack(children: [
            SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: screens()),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavigation(
                onTabTapped: onTabTapped,
                selectedIndex: selectedIndex,
              ),
            )
          ])),
    );
  }

  Widget screens() {
    switch (selectedIndex) {
      case 0:
        return const WalletScreen();
      case 1:
        return const StatusScreen();
      case 2:
        return const NotificationScreen();
      case 3:
        return const SettingsScreen();
      default:
        return Container();
    }
  }
}
