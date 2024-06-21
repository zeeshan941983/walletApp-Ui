import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pocket_io/components/colors.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabTapped;

  const BottomNavigation({
    required this.selectedIndex,
    required this.onTabTapped,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.06,
        vertical: size.height * 0.04,
      ),
      height: size.height * 0.1,
      decoration: BoxDecoration(
        color: CustColors.darkpurple0,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          iconDesign(IconlyBold.wallet, 0),
          iconDesign(IconlyBold.filter, 1),
          iconDesign(IconlyBold.notification, 2),
          iconDesign(IconlyBold.setting, 3),
        ],
      ),
    );
  }

  Widget iconDesign(IconData icon, int index) {
    return GestureDetector(
      onTap: () => onTabTapped(index),
      child: AnimatedOpacity(
        opacity: selectedIndex == index ? 1 : 0.2,
        duration: const Duration(milliseconds: 200),
        child: Icon(
          icon,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
