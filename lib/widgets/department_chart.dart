import 'package:fl_chart/fl_chart.dart';
import '../main_imports.dart';

class DepartmentChart extends StatefulWidget {
  @override
  _DepartmentChartState createState() => _DepartmentChartState();
}

class _DepartmentChartState extends State<DepartmentChart> {
  bool _boolCheck = true;
  List<double> departmentData = [];
  double maxdepValue = 0;
  double mindepValue = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_boolCheck == true) {
      final dep1aData = Provider.of<SteeringProvider>(context).totalItemCost;
      final dep1bData = Provider.of<SuspensionProvider>(context).totalItemCost;
      final dep2aData = Provider.of<ExhaustProvider>(context).totalItemCost;
      final dep2bData = Provider.of<CoolingProvider>(context).totalItemCost;
      final dep2cData = Provider.of<IntakeProvider>(context).totalItemCost;
      final dep2dData = Provider.of<DriveTrainProvider>(context).totalItemCost;
      final dep3Data = Provider.of<BrakesProvider>(context).totalItemCost;
      final dep4Data = Provider.of<ChassisProvider>(context).totalItemCost;
      final dep5Data = Provider.of<ElectronicsProvider>(context).totalItemCost;
      final dep6Data =
          Provider.of<MiscellaneousProvider>(context).totalItemCost;
      var dep1TotalCost = dep1aData + dep1bData;
      var dep2TotalCost = dep2aData + dep2bData + dep2cData + dep2dData;

      departmentData = [
        dep1TotalCost,
        dep2TotalCost,
        dep3Data,
        dep4Data,
        dep5Data,
        dep6Data
      ];
      maxdepValue = departmentData
          .reduce((current, next) => current > next ? current : next);
      mindepValue = departmentData
          .reduce((current, next) => current < next ? current : next);
    }
  }

  // List<double> departmentData = [, 454, 1663, 1000.34, 354, 1235.44];
  int touchedIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xff81e5cd),
      ),
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
        maxY: maxdepValue + 1000,
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
            return '\₹' + '100';
          } else if (value == 10000) {
            return "\₹" + "10000";
          } else {
            return '';
          }
        },
      ),
    );
  }
}
