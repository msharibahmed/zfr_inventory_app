import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DepartmentChart extends StatefulWidget {
  @override
  _DepartmentChartState createState() => _DepartmentChartState();
}

class _DepartmentChartState extends State<DepartmentChart> {
  final List<double> departmentData = [743.5, 454, 1663, 1000.34, 354, 1235.44];
  int touchedIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Color(0xff81e5cd),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Cost Analysis',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Divider(
            color: Colors.black,
            endIndent: 210,
          ),
          Text('Department Wise',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500)),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: BarChart(mainBarData()),
          ))
        ],
      ),
    );
  }

  BarChartGroupData _buildBar(int x, double y, {bool isTouched = false}) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(
          y: isTouched ? y + 500 : y,
          color: isTouched ? Colors.amber : Colors.white,
          width: 20,
          borderRadius: BorderRadius.all(Radius.circular(0)),
          backDrawRodData: BackgroundBarChartRodData(
            color: Color(0xff72d8bf),
            show: true,
            y: departmentData.reduce(
                    (current, next) => current > next ? current : next) +
                1000,
          ))
    ]);
  }

  List<BarChartGroupData> _buildAllBars() {
    return List.generate(
        departmentData.length,
        (index) => _buildBar(index, departmentData[index],
            isTouched: index == touchedIndex));
  }

  BarChartData mainBarData() {
    return BarChartData(
        barTouchData: _buildBarTouchData(),
        maxY: departmentData
                .reduce((current, next) => current > next ? current : next) +
            1000,
        titlesData: _buildAxes(),
        borderData: FlBorderData(show: true, border: Border.all(width: 0.1)),
        barGroups: _buildAllBars());
  }

  BarTouchData _buildBarTouchData() {
    return BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.grey[300],
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String department;
            switch (group.x.toInt()) {
              case 0:
                department = 'Vehicle Dynamics';
                break;
              case 1:
                department = 'Power Train';
                break;
              case 2:
                department = 'Brakes';
                break;
              case 3:
                department = 'Chassis';
                break;
              case 4:
                department = 'Electronics';
                break;
              case 5:
                department = 'Miscellaneous';
                break;
            }
            return BarTooltipItem(
                department + '\n' + '\$${(rod.y - 500).toStringAsFixed(2)}',
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold));
          },
        ),
        touchCallback: (barTouchResponse) {
          setState(() {
            if (barTouchResponse.spot != null &&
                barTouchResponse.touchInput is! FlPanEnd &&
                barTouchResponse.touchInput is! FlLongPressEnd) {
              touchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
            } else {
              touchedIndex = -1;
            }
          });
        });
  }

  FlTitlesData _buildAxes() {
    return FlTitlesData(
      //buildng x-axis
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 15,
        textStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
        margin: 10,
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return 'VD';
            case 1:
              return 'PT';
            case 2:
              return 'B';

            case 3:
              return 'C';
            case 4:
              return 'E';
            case 5:
              return 'M';
            default:
              return '';
          }
        },
      ),

      //buildng y-axis
      leftTitles: SideTitles(
        showTitles: true,
        reservedSize: 40,
        textStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
        margin: 15,
        getTitles: (value) {
          if (value == 0) {
            return '\$' + '100';
          } else if (value == 1000) {
            return '\$' + '1000';
          } else if (value == 2000) {
            return '\$' + '2000';
          } else if (value ==
              departmentData.reduce(
                  (current, next) => current > next ? current : next - 100)) {
            return '\$${departmentData.reduce((current, next) => current > next ? current : next - 100.toInt())}';
          } else {
            return '';
          }
        },
      ),
    );
  }
}
