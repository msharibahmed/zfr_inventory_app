import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:zfr_inventory_app/main_imports.dart';
import 'package:zfr_inventory_app/provider/other/budget.dart';

class LineChartSample2 extends StatefulWidget {
  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  // bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            color: Color(0xff232d37),
            padding: EdgeInsets.all(5),
            child: Text(
              'Total Cost/MonthWise',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            )),
        Stack(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(color: Color(0xff232d37)),
              child: Padding(
                  padding: const EdgeInsets.only(
                      right: 18.0, left: 12.0, top: 24, bottom: 12),
                  child: Consumer<BudgetProv>(
                      builder: (context, data, _) => LineChart(
                            mainData(data.lst),
                          ))),
            ),
          ],
        )
      ],
    );
  }

  LineChartData mainData(List<double> lst) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 0,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 0,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 15,
          textStyle: const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.normal,
              fontSize: 12),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'JAN';
              case 1:
                return 'FEB';
              case 2:
                return 'MAR';
              case 3:
                return 'APR';
              case 4:
                return 'MAY';
              case 5:
                return 'JUN';

              case 6:
                return 'JUL';
              case 7:
                return 'AUG';
              case 8:
                return 'SEP';
              case 9:
                return 'OCT';
              case 10:
                return 'NOV';
              case 11:
                return 'DEC';
            }
            return '';
          },
          margin: 5,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '0';
              case 2000:
                return '2000';
              case 1000:
                return '1000';
              case 3000:
                return '3000';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 0.5)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: lst.reduce(max) + 1000,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, lst[0]),
            FlSpot(1, lst[1]),
            FlSpot(2, lst[2]),
            FlSpot(3, lst[3]),
            FlSpot(4, lst[4]),
            FlSpot(5, lst[5]),
            FlSpot(6, lst[6]),
            FlSpot(7, lst[7]),
            FlSpot(8, lst[8]),
            FlSpot(9, lst[9]),
            FlSpot(10, lst[10]),
            FlSpot(11, lst[11]),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 1.5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.2)).toList(),
          ),
        ),
      ],
    );
  }
}
