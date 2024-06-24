import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight? weight;
  const CustomText(
      {super.key,
      required this.color,
      required this.fontSize,
      this.weight,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      style: GoogleFonts.poppins(
          color: color, fontSize: fontSize, fontWeight: weight),
    );
  }
}
