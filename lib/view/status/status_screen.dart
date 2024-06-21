import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pocket_io/components/colors.dart';
import 'package:pocket_io/constrants/widgets/transaction_design.dart';

List<FlSpot> generateData() {
  return [
    const FlSpot(0, 10),
    const FlSpot(1, 80),
    const FlSpot(2, 20),
    const FlSpot(3, 70),
  ];
}

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          // const SizedBox(
          //   height: 10,
          // ),
          Text(
            'Total Balance',
            style: GoogleFonts.poppins(color: CustColors.grey, fontSize: 18),
          ),
          Text(
            '\$ 13.248',
            style: GoogleFonts.poppins(color: CustColors.purple, fontSize: 35),
          ),
          ExpenseLineChart(),
          transaction(),
        ],
      ),
    );
  }
}

class ExpenseLineChart extends StatelessWidget {
  ExpenseLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    List<FlSpot> chartData = generateData();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textstyle('Income Stats'),
              Row(
                children: [
                  textstyle('Oct-Feb'),
                  const Icon(Icons.arrow_downward_rounded)
                ],
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: AspectRatio(
              aspectRatio: 1.7,
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
                        spots: chartData,
                        isCurved: true,
                        barWidth: 3,
                        shadow: Shadow(
                            color: CustColors.purple,
                            offset: const Offset(0, 10),
                            blurRadius: 40),
                        color: CustColors.purple),
                  ],
                  lineTouchData: LineTouchData(
                      touchTooltipData: LineTouchTooltipData(
                          getTooltipItems: (List<LineBarSpot> lineBarSpots) {
                    return lineBarSpots.map((LineBarSpot lineBarSpot) {
                      final FlSpot spot = lineBarSpot;
                      if (spot.x == 0) {
                        return LineTooltipItem('Oct: \$${spot.y}',
                            const TextStyle(color: Colors.white));
                      } else if (spot.x == 1) {
                        return LineTooltipItem('Nov: \$${spot.y}',
                            const TextStyle(color: Colors.white));
                      } else if (spot.x == 2) {
                        return LineTooltipItem('Dec: \$${spot.y}',
                            const TextStyle(color: Colors.white));
                      } else if (spot.x == 3) {
                        return LineTooltipItem('Jan: \$${spot.y}',
                            const TextStyle(color: Colors.white));
                      } else {
                        return const LineTooltipItem(
                            'Unknown', const TextStyle(color: Colors.white));
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
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textstyle('Oct'),
              textstyle('Nov'),
              textstyle('Dec'),
              textstyle('Jan'),
            ],
          )
        ],
      ),
    );
  }

  Widget textstyle(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(),
    );
  }
}
