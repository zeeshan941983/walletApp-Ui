import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:pocket_io/components/colors.dart';
import 'package:pocket_io/constrants/widgets/icon_container.dart';

Widget cardDesign(BuildContext context) {
  var size = MediaQuery.of(context).size;
  return Container(
    margin: const EdgeInsets.all(10),
    height: size.height * .2,
    width: double.infinity,
    decoration: BoxDecoration(
      color: CustColors.darkpurple1,
      borderRadius: BorderRadius.circular(40),
    ),
    child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/cardScreen');
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Stack(
          children: [
            Positioned(
              left: size.width * 0.02,
              top: -size.width * 0.03,
              child: Container(
                height: 54,
                width: 58.35,
                decoration: BoxDecoration(
                    color: CustColors.darkpurple2, shape: BoxShape.circle),
              ),
            ),
            Positioned(
              bottom: -size.height * 0.04,
              right: -size.height * 0.05,
              child: Align(
                child: Container(
                  height: 143,
                  width: 154.53,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: CustColors.purple, width: 3)),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(
                      right: size.width / 4,
                      left: size.width / 20,
                      top: 0,
                      bottom: 0),
                  leading: Text(
                    "Balance",
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 20),
                  ),
                  trailing: Text(
                    "Card",
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 20),
                  ),
                ),
                ListTile(
                  leading: Text(
                    "\$ 1.234",
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 40),
                  ),
                  trailing: Text(
                    "Mabank",
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 30),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget iconDesign() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      IconContainer(
        icon: IconlyBold.swap,
        title: 'Transfer',
      ),
      IconContainer(
        icon: IconlyBold.wallet,
        title: 'Payment',
      ),
      IconContainer(
        icon: IconlyBold.activity,
        title: 'Payout',
      ),
      IconContainer(
        icon: CupertinoIcons.add_circled,
        title: 'Top up',
      ),
    ],
  );
}
