
import 'package:flutter/material.dart';
import 'package:zfr_inventory_app/provider/other/budget.dart';
import 'package:zfr_inventory_app/provider/other/tasks.dart';
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
  var _boolCheck1 = true;
  var _boolCheck2 = true;
  // bool button = false;
  @override
  void didChangeDependencies() {
   
    if (_boolCheck1) {
      

      final budget = Provider.of<BudgetProv>(context, listen: false);
    Provider.of<SteeringProvider>(context, listen: false)
          .fetchItems(context).then((value) => Provider.of<SuspensionProvider>(context, listen: false)
          .fetchItems(context).then((value) =>  Provider.of<ExhaustProvider>(context, listen: false)
          .fetchItems(context).then((value) =>  Provider.of<CoolingProvider>(context, listen: false)
          .fetchItems(context).then((value) => Provider.of<IntakeProvider>(context, listen: false)
          .fetchItems(context).then((value) =>Provider.of<DriveTrainProvider>(context, listen: false)
          .fetchItems(context).then((value) =>   Provider.of<BrakesProvider>(context, listen: false)
          .fetchItems(context).then((value) => 
      Provider.of<ChassisProvider>(context, listen: false)
          .fetchItems(context).then((value) =>Provider.of<ElectronicsProvider>(context, listen: false)
          .fetchItems(context).then((value) => Provider.of<MiscellaneousProvider>(context, listen: false)
          .fetchItems(context).then((value) => budget.fetchBudget(2).then((value) =>       budget.fetchBudget(3)
.then((value) =>      budget.fetchBudget(4)
.then((value) =>       budget.fetchBudget(5)
.then((value) =>     budget.fetchBudget(6)
.then((value) =>      budget.fetchBudget(7)
.then((value) =>      Provider.of<TasksProv>(context, listen: false).fetch(context).then((value) { setState(() {
        _boolCheck2 = false;
      });} )) ) )) )))) )) ) )))));
       
    
      
  
    
     
    }
    _boolCheck1 = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_boolCheck2?Center(child: CircularProgressIndicator()):Column(
        children: [
          widget.button ? DepartmentChart() : LineChartSample2(),
          DepartmentProgress()
        ],
      ),
    );
  }
}
