import 'package:flutter/material.dart';
import 'package:pocket_io/components/colors.dart';
import 'package:pocket_io/constrants/widgets/custom_text.dart';

class NotificationCard extends StatelessWidget {
  final CustomPainter painter;
  final String time;
  final String title;
  final String subtitle;
  final Color borderColor;
  const NotificationCard(
      {super.key,
      required this.painter,
      required this.time,
      required this.title,
      required this.subtitle,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.only(right: 20, left: 10, top: 10),
      height: size.height * 0.16,
      width: double.infinity,
      decoration: BoxDecoration(
          color: CustColors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 2),
                color: Colors.grey.shade300,
                blurRadius: 14,
                spreadRadius: 1),
          ],
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomText(text: time, color: CustColors.grey, fontSize: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                  text: title, color: CustColors.pureBlack, fontSize: 15),
              Container(
                height: size.height * 0.04,
                width: size.width * 0.08,
                decoration: BoxDecoration(
                    border: Border.all(color: borderColor, width: 3),
                    shape: BoxShape.circle),
                child: CustomPaint(
                  painter: painter,
                ),
              ),
            ],
          ),
          CustomText(color: CustColors.grey, fontSize: 16, text: subtitle)
        ],
      ),
    );
  }
}
