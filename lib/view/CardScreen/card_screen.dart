import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocket_io/components/colors.dart';
import 'package:pocket_io/constrants/widgets/custom_button.dart';
import 'package:pocket_io/constrants/widgets/custom_textbutton.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isFront = true;
  int count = 0;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipToFront() {
    _controller.reverse().then((_) {
      setState(() {
        _isFront = true;
      });
    });
  }

  void _flipToBack() {
    _controller.forward().then((_) {
      setState(() {
        _isFront = false;
      });

      Future.delayed(const Duration(milliseconds: 200), () {
        _flipToFront();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            if (_isFront) {
              _flipToBack();
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomButton(
                ontap: () {
                  Navigator.pop(context);
                },
                icon: Icons.arrow_back_ios,
              ),
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  final angle = _controller.value * 3.14159;
                  return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(angle),
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        height: 500,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: CustColors.darkpurple1,
                            borderRadius: BorderRadius.circular(50)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Stack(
                            children: [
                              Positioned(
                                top: -70,
                                left: 0,
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: CustColors.purple,
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                              ),
                              Positioned(
                                top: 50,
                                left: 50,
                                child: Container(
                                  height: 90,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: CustColors.chipcolor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: CustomPaint(
                                    painter: NPainter(),
                                  ),
                                ),
                              ),
                              Positioned(
                                  right: -20,
                                  top: -20,
                                  child: Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: CustColors.purple, width: 5),
                                        shape: BoxShape.circle),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "CVV",
                                            style: GoogleFonts.courierPrime(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            "512",
                                            style: GoogleFonts.courierPrime(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                              Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "4854 9834 **** ****",
                                        style: GoogleFonts.courierPrime(
                                            color: Colors.white, fontSize: 25),
                                      ),
                                      Text(
                                        "ZEESHAN AHMAD",
                                        style: GoogleFonts.courierPrime(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  )),
                              Positioned(
                                  right: -20,
                                  bottom: -20,
                                  child: Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: CustColors.pickCircle,
                                            width: 5),
                                        shape: BoxShape.circle),
                                    child: Image.asset('assets/img/visa.png'),
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 30),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "EXP: 12/30",
                                    style: GoogleFonts.courierPrime(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                },
              ),
              Center(
                  child: CustomTextbutton(
                text: 'Delete Card',
                color: CustColors.purple,
                ontap: () {},
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class NPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = CustColors.darkpurple1
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;

    double width = size.width;
    double height = size.height;

    // Starting point for the N shape
    Offset startPoint = Offset(size.width / 1.6, 0);

    // First vertical line of the N
    Offset line1End = Offset(size.width / 1.6, 40);
    canvas.drawLine(startPoint, line1End, paint);

    // Second diagonal line of the N
    Offset line2Start = line1End;
    Offset line2End = Offset(width * 0.36, 40);
    canvas.drawLine(line2Start, line2End, paint);

    // Third vertical line of the N
    Offset line3Start = line2End;
    Offset line3End = Offset(width * 0.36, height);
    canvas.drawLine(line3Start, line3End, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
