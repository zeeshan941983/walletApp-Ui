import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pocket_io/components/colors.dart';

import 'package:pocket_io/constrants/widgets/custom_text.dart';
import 'package:pocket_io/view/settings_screen/widget/settings_design.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInCubic),
    );
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Opacity(
          opacity: animation.value,
          child: Center(
            child: Column(children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              CustomText(
                  color: CustColors.darkpurple2,
                  fontSize: 20,
                  text: "Settings"),
              SettingsDesign(
                icon: IconlyBold.profile,
                title: 'Profile',
                onTap: () {},
              ),
              SettingsDesign(
                icon: IconlyBold.notification,
                title: 'Notifications',
                onTap: () {},
              ),
              SettingsDesign(
                icon: IconlyBold.wallet,
                title: 'Your Wallet',
                onTap: () {},
              ),
              SettingsDesign(
                icon: IconlyBold.lock,
                title: 'Login Settings',
                onTap: () {},
              ),
              SettingsDesign(
                icon: IconlyBold.calling,
                title: 'Service Center',
                onTap: () {},
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    IconlyBold.logout,
                    color: CustColors.purple,
                    size: size.height * 0.05,
                  )),
              CustomText(
                  color: CustColors.purple, fontSize: 20, text: 'Log Out')
            ]),
          ),
        );
      },
    );
  }
}
