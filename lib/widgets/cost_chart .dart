import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:zfr_inventory_app/main_imports.dart';

class LineChartSample2 extends StatefulWidget {
  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: <Widget>[
            Container(
                height: 320,
                width: double.infinity,
                decoration: const BoxDecoration(color: Color(0xff232d37)),
                child: Padding(
                    padding: const EdgeInsets.only(
                        right: 18.0, left: 12.0, top: 24, bottom: 12),
                    child: LineChart(
                      mainData(),
                    ))),
            Container(
                width: double.infinity,
                color: Color(0xff232d37),
                padding: EdgeInsets.all(10),
                child: Text(
                  'Total Cost' + '\n' + 'MonthWise',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ],
        )
      ],
    );
  }

  LineChartData mainData() {
    final a = Provider.of<SteeringProvider>(context, listen: false);
    final b = Provider.of<SuspensionProvider>(context, listen: false);
    final c = Provider.of<ExhaustProvider>(context, listen: false);
    final d = Provider.of<CoolingProvider>(context, listen: false);
    final e = Provider.of<IntakeProvider>(context, listen: false);
    final f = Provider.of<DriveTrainProvider>(context, listen: false);
    final g = Provider.of<BrakesProvider>(context, listen: false);
    final h = Provider.of<ChassisProvider>(context, listen: false);
    final i = Provider.of<ElectronicsProvider>(context, listen: false);
    final j = Provider.of<MiscellaneousProvider>(context, listen: false);

    double jan = a.va[0] +
        b.va[0] +
        c.va[0] +
        d.va[0] +
        e.va[0] +
        f.va[0] +
        g.va[0] +
        h.va[0] +
        i.va[0] +
        j.va[0];
    double feb = a.va[1] +
        b.va[1] +
        c.va[1] +
        d.va[1] +
        e.va[1] +
        f.va[1] +
        g.va[1] +
        h.va[1] +
        i.va[1] +
        j.va[1];
    double mar = a.va[2] +
        b.va[2] +
        c.va[2] +
        d.va[2] +
        e.va[2] +
        f.va[2] +
        g.va[2] +
        h.va[2] +
        i.va[2] +
        j.va[2];

    double apr = a.va[3] +
        b.va[3] +
        c.va[3] +
        d.va[3] +
        e.va[3] +
        f.va[3] +
        g.va[3] +
        h.va[3] +
        i.va[3] +
        j.va[3];
    double may = a.va[4] +
        b.va[4] +
        c.va[4] +
        d.va[4] +
        e.va[4] +
        f.va[4] +
        g.va[4] +
        h.va[4] +
        i.va[4] +
        j.va[4];

    double jun = a.va[5] +
        b.va[5] +
        c.va[5] +
        d.va[5] +
        e.va[5] +
        f.va[5] +
        g.va[5] +
        h.va[5] +
        i.va[5] +
        j.va[5];

    double jul = a.va[6] +
        b.va[6] +
        c.va[6] +
        d.va[6] +
        e.va[6] +
        f.va[6] +
        g.va[6] +
        h.va[6] +
        i.va[6] +
        j.va[6];

    double aug = a.va[7] +
        b.va[7] +
        c.va[7] +
        d.va[7] +
        e.va[7] +
        f.va[7] +
        g.va[7] +
        h.va[7] +
        i.va[7] +
        j.va[7];

    double sep = a.va[8] +
        b.va[8] +
        c.va[8] +
        d.va[8] +
        e.va[8] +
        f.va[8] +
        g.va[8] +
        h.va[8] +
        i.va[8] +
        j.va[8];

    double oct = a.va[9] +
        b.va[9] +
        c.va[9] +
        d.va[9] +
        e.va[9] +
        f.va[9] +
        g.va[9] +
        h.va[9] +
        i.va[9] +
        j.va[9];

    double nov = a.va[10] +
        b.va[10] +
        c.va[10] +
        d.va[10] +
        e.va[10] +
        f.va[10] +
        g.va[10] +
        h.va[10] +
        i.va[10] +
        j.va[10];

    double dec = a.va[11] +
        b.va[11] +
        c.va[11] +
        d.va[11] +
        e.va[11] +
        f.va[11] +
        g.va[11] +
        h.va[11] +
        i.va[11] +
        j.va[11];

    List lst = [
      double.parse(jan.toStringAsFixed(2)),
      double.parse(feb.toStringAsFixed(2)),
      double.parse(mar.toStringAsFixed(2)),
      double.parse(apr.toStringAsFixed(2)),
      double.parse(may.toStringAsFixed(2)),
      double.parse(jun.toStringAsFixed(2)),
      double.parse(jul.toStringAsFixed(2)),
      double.parse(aug.toStringAsFixed(2)),
      double.parse(sep.toStringAsFixed(2)),
      double.parse(oct.toStringAsFixed(2)),
      double.parse(nov.toStringAsFixed(2)),
      double.parse(dec.toStringAsFixed(2))
    ];

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
      maxY: lst.reduce((value, element) => value > element ? value : element) +
          1000,
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
