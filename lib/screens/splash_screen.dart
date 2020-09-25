import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:zfr_inventory_app/main_imports.dart';
import 'package:zfr_inventory_app/provider/other/budget.dart';
import 'package:zfr_inventory_app/provider/other/tasks.dart';
import 'package:zfr_inventory_app/screens/tab_screen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future<void> fetch ()async{

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
.then((value) =>      Provider.of<TasksProv>(context, listen: false).fetch(context)) ) )) )))) )) ) )))));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body:FutureBuilder(future:fetch() ,builder: (ctx,snapshot)=>snapshot.connectionState==ConnectionState.waiting?Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/splash.gif'),
              SizedBox(
                height: 100,
              ),
              Text(
                'Z       F       R',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              SizedBox(
                height: 15,
              ),
              CircularProgressIndicator()
            ],
          ),
        ):TabScreen()) 
        );
  }
}
