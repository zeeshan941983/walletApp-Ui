import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pocket_io/components/colors.dart';
import 'package:pocket_io/constrants/widgets/transaction_design.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Text(
              'Total Balance',
              style: GoogleFonts.poppins(color: CustColors.grey, fontSize: 18),
            ),
            Text(
              '\$ 13.248',
              style: GoogleFonts.poppins(
                  color: CustColors.purple,
                  fontSize: 35,
                  fontWeight: FontWeight.w500),
            ),
            ExpenseLineChart(),
            transaction('Transaction History', ''),
          ],
        ),
      ),
    );
  }
}

class ExpenseLineChart extends StatefulWidget {
  ExpenseLineChart({super.key});

  @override
  State<ExpenseLineChart> createState() => _ExpenseLineChartState();
}

class _ExpenseLineChartState extends State<ExpenseLineChart>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Animation val;
  List<FlSpot> generateData = [
    const FlSpot(0, 0),
    const FlSpot(1, 0),
    const FlSpot(2, 0),
    const FlSpot(3, 0),
  ];

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.slowMiddle),
    );

    controller.forward();

    animation.addListener(() {
      setState(() {
        generateData = generateAnimatedData(animation.value);
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<FlSpot> generateAnimatedData(double animationValue) {
    List<FlSpot> newData = [
      FlSpot(0, lerpDouble(0, 10, animationValue)!),
      FlSpot(1, lerpDouble(0, 80, animationValue)!),
      FlSpot(2, lerpDouble(0, 20, animationValue)!),
      FlSpot(3, lerpDouble(0, 70, animationValue)!),
    ];

    return newData;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textstyle('Income Stats', CustColors.darkpurple0, 18),
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: CustColors.grey)),
                child: Row(
                  children: [
                    textstyle('Oct-Feb', CustColors.grey, 15),
                    Icon(
                      Icons.arrow_downward_rounded,
                      color: CustColors.grey,
                      size: 20,
                    )
                  ],
                ),
              ),
            ],
          ),
          AspectRatio(
            aspectRatio: 1.7,
            child: AnimatedBuilder(
              animation: animation,
              builder: (BuildContext context, Widget? child) {
                return Opacity(
                  opacity: animation.value,
                  child: LineChart(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceIn,
                    LineChartData(
                      minX: 0,
                      maxX: 3,
                      minY: 0,
                      maxY: 150,
                      lineBarsData: [
                        LineChartBarData(
                            spots: generateData,
                            isCurved: true,
                            curveSmoothness: 0.3,
                            barWidth: 4,
                            shadow: Shadow(
                                color: CustColors.purple,
                                offset: const Offset(0, 10),
                                blurRadius: 60),
                            color: CustColors.purple),
                      ],
                      lineTouchData: LineTouchData(
                          touchTooltipData: LineTouchTooltipData(
                              getTooltipItems:
                                  (List<LineBarSpot> lineBarSpots) {
                        return lineBarSpots.map((LineBarSpot lineBarSpot) {
                          final FlSpot spot = lineBarSpot;
                          if (spot.x == 0) {
                            return LineTooltipItem('Oct: \$${spot.y}',
                                TextStyle(color: CustColors.white));
                          } else if (spot.x == 1) {
                            return LineTooltipItem('Nov: \$${spot.y}',
                                TextStyle(color: CustColors.white));
                          } else if (spot.x == 2) {
                            return LineTooltipItem('Dec: \$${spot.y}',
                                TextStyle(color: CustColors.white));
                          } else if (spot.x == 3) {
                            return LineTooltipItem('Jan: \$${spot.y}',
                                TextStyle(color: CustColors.white));
                          } else {
                            return LineTooltipItem(
                                'Unknown', TextStyle(color: CustColors.white));
                          }
                        }).toList();
                      }, getTooltipColor: (color) {
                        return CustColors.purple;
                      })),
                      gridData: const FlGridData(show: false),
                      titlesData: const FlTitlesData(
                        show: false,
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(color: Colors.transparent),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textstyle('Oct', CustColors.grey, 18),
              textstyle('Nov', CustColors.grey, 18),
              textstyle('Dec', CustColors.grey, 18),
              textstyle('Jan', CustColors.grey, 18),
            ],
          )
        ],
      ),
    );
  }

  Widget textstyle(String text, Color color, double size) {
    return Text(
      text,
      style: GoogleFonts.poppins(color: color, fontSize: size),
    );
  }
}
