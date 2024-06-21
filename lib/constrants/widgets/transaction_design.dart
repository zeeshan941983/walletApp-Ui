import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_fonts/google_fonts.dart';

class TransactionDesign extends StatelessWidget {
  final String name;
  final String subtitle;
  final String price;
  final String img;
  const TransactionDesign(
      {super.key,
      required this.subtitle,
      required this.name,
      required this.price,
      required this.img});

  @override
  Widget build(BuildContext context) {
    final Widget svgIcon = SvgPicture.asset(img);
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        leading: svgIcon,
        title: Text(name),
        trailing: Text(
          price,
          style: const TextStyle(fontSize: 20),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}

Widget transaction() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Last Transaction',
              style: GoogleFonts.poppins(
                  color: const Color(0xff2F1155), fontSize: 18),
            ),
            Text(
              'View All',
              style: GoogleFonts.poppins(
                  color: const Color(0xff6E34B8), fontSize: 13),
            ),
          ],
        ),
      ),
      const TransactionDesign(
        name: 'Netflix',
        subtitle: 'Month subscription',
        price: "\$12",
        img: 'assets/img/netflix.svg',
      ),
      const TransactionDesign(
        img: 'assets/img/paypal.svg',
        name: 'Paypal',
        subtitle: 'Tax',
        price: "\$10",
      ),
      const TransactionDesign(
        img: 'assets/img/buylater.svg',
        name: 'Paylater',
        subtitle: 'Buy item',
        price: "\$2",
      ),
    ],
  );
}
