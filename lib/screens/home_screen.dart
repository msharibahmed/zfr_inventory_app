import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../widgets/drawer_widget.dart';



class HomeScreen extends StatelessWidget {
    static const routeName = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: DrawerWidget(),),
      appBar: AppBar(title:Text('ZFR Inventory')),
      body: Container(
        height: 500,
        child: SfCartesianChart()
      ),
      
    );
  }
}