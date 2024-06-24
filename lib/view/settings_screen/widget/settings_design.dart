import 'package:flutter/material.dart';

import 'package:pocket_io/components/colors.dart';
import 'package:pocket_io/constrants/widgets/custom_text.dart';

class SettingsDesign extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() onTap;
  const SettingsDesign(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10, right: 0),
        height: size.height * 0.07,
        width: double.infinity,
        decoration: BoxDecoration(
            color: CustColors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Icon(icon, color: CustColors.purple),
            SizedBox(width: size.width * 0.06),
            Expanded(
              child: CustomText(
                  color: CustColors.darkpurple0, fontSize: 18, text: title),
            ),
            const Spacer(),
            const Icon(Icons.arrow_right_outlined),
            SizedBox(width: size.width * 0.03)
          ],
        ),
      ),
    );
  }
}
