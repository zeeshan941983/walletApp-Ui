import 'package:flutter/material.dart';
import 'package:pocket_io/components/colors.dart';

class IconContainer extends StatelessWidget {
  final IconData icon;
  final String title;
  const IconContainer({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 60,
            decoration: BoxDecoration(
                color: CustColors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade200,
                      offset: const Offset(0, 3),
                      blurRadius: 0.7)
                ]),
            child: Icon(
              icon,
              size: 30,
              color: CustColors.darkpurple2,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(color: CustColors.grey),
          )
        ],
      ),
    );
  }
}
