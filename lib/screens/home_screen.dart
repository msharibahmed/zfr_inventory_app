import 'package:flutter/material.dart';
import 'package:zfr_inventory_app/widgets/department_progress.dart';
import '../main_imports.dart';

import '../widgets/cost_chart%20.dart';

import '../widgets/department_chart.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home-screen';
  final bool button;
  HomeScreen(this.button);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // bool button = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          widget.button ? DepartmentChart() : LineChartSample2(),
          DepartmentProgress()
        ],
      ),
    );
  }
}
