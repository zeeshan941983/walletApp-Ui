import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocket_io/constrants/widgets/card_design.dart';
import 'package:pocket_io/constrants/widgets/transaction_design.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topBar(),
          cardDesign(context),
          iconDesign(),
          transaction(),
        ]);
  }

  Widget topBar() {
    return ListTile(
      title: Text(
        "Wallet",
        style: GoogleFonts.poppins(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          color: const Color(0xff2F1155),
        ),
      ),
      trailing: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(
          'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
        ),
      ),
      subtitle: Text(
        "Active",
        style: GoogleFonts.poppins(
          fontSize: 18,
          color: const Color(0xff828282),
        ),
      ),
    );
  }
}
