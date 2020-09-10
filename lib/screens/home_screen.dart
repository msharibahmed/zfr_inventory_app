import 'package:flutter/material.dart';
import 'package:zfr_inventory_app/widgets/department_progress.dart';
import '../main_imports.dart';
import '../widgets/cost_chart%20.dart';

import '../widgets/drawer_widget.dart';
import '../widgets/department_chart.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool button = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      appBar: AppBar(
        elevation: 10,
        title: Text(
          'ZFR Inventory',
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.ac_unit),
              onPressed: () {
                setState(() {
                  button = !button;
                });
                print(button);
              })
        ],
      ),
      body: Column(
        children: [
          button ? DepartmentChart() : LineChartSample2(),
          DepartmentProgress()
        ],
      ),
    );
  }
}
