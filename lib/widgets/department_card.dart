import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zfr_inventory_app/screens/sub_department_screens/brakes_screen.dart';
import 'package:zfr_inventory_app/screens/sub_department_screens/chassis_screen.dart';
import 'package:zfr_inventory_app/screens/sub_department_screens/cooling_screen.dart';
import 'package:zfr_inventory_app/screens/sub_department_screens/drive_train_screen.dart';
import 'package:zfr_inventory_app/screens/sub_department_screens/electronics_screen.dart';
import 'package:zfr_inventory_app/screens/sub_department_screens/exhaust_screen.dart';
import 'package:zfr_inventory_app/screens/sub_department_screens/intake_screen.dart';
import 'package:zfr_inventory_app/screens/sub_department_screens/miscellaneous_screen.dart';
import 'package:zfr_inventory_app/screens/sub_department_screens/suspension_screen.dart';

import '../provider/departments_provider/brakes.dart';
import '../provider/departments_provider/chassis.dart';
import '../provider/departments_provider/cooling.dart';
import '../provider/departments_provider/drive_train.dart';
import '../provider/departments_provider/electronics.dart';
import '../provider/departments_provider/exhaust.dart';
import '../provider/departments_provider/intake.dart';
import '../provider/departments_provider/miscellaneous.dart';
import '../provider/departments_provider/steering.dart';
import '../provider/departments_provider/suspension.dart';
import '../screens/sub_department_screens/steering_screen.dart.dart';

class DepartmentCard extends StatelessWidget {
  final int index;

  DepartmentCard(this.index);
  @override
  Widget build(BuildContext context) {
    final steeringData = Provider.of<SteeringProvider>(context);
    final suspensionData = Provider.of<SuspensionProvider>(context);
    final coolingData = Provider.of<CoolingProvider>(context);
    final driveTrainData = Provider.of<DriveTrainProvider>(context);
    final exhaustData = Provider.of<ExhaustProvider>(context);
    final intakeData = Provider.of<IntakeProvider>(context);
    final brakesData = Provider.of<BrakesProvider>(context);
    final chassisData = Provider.of<ChassisProvider>(context);
    final electronicsData = Provider.of<ElectronicsProvider>(context);
    final miscellaneousData = Provider.of<MiscellaneousProvider>(context);

    const Map<String, List> departmentNames = {
      'Vehicle Dynamics': ['Steering', 'Suspension'],
      'Power Train': ['Cooling', 'Drive Train', 'Exhaust', 'Intake'],
      'Brakes': ['Cost of Brakes'],
      'Chassis': ['Cost of Chassis'],
      'Electronics': ['Cost of Electronics'],
      'Miscellaneous': ['Cost of Miscellaneous']
    };
    List<DepartmentModel> modelData = [
      DepartmentModel(
          name: 'Steering',
          routeName: SteeringItemListScreen.routeName,
          total: steeringData.totalItemCost.toStringAsFixed(2)),
      DepartmentModel(
          name: 'Suspension',
          routeName: SuspensionItemListScreen.routeName,
          total: suspensionData.totalItemCost.toStringAsFixed(2)),
      DepartmentModel(
          name: 'Cooling',
          routeName: CoolingItemListScreen.routeName,
          total: coolingData.totalItemCost.toStringAsFixed(2)),
      DepartmentModel(
          name: 'Drive Train',
          routeName: DriveTrainItemListScreen.routeName,
          total: driveTrainData.totalItemCost.toStringAsFixed(2)),
      DepartmentModel(
          name: 'Exhaust',
          routeName: ExhaustItemListScreen.routeName,
          total: exhaustData.totalItemCost.toStringAsFixed(2)),
      DepartmentModel(
          name: 'Intake',
          routeName: IntakeItemListScreen.routeName,
          total: intakeData.totalItemCost.toStringAsFixed(2)),
      DepartmentModel(
          name: 'Cost of Brakes',
          routeName: BrakesItemListScreen.routeName,
          total: brakesData.totalItemCost.toStringAsFixed(2)),
      DepartmentModel(
          name: 'Cost of Chassis',
          routeName: ChassisItemListScreen.routeName,
          total: chassisData.totalItemCost.toStringAsFixed(2)),
      DepartmentModel(
          name: 'Cost of Electronics',
          routeName: ElectronicsItemListScreen.routeName,
          total: electronicsData.totalItemCost.toStringAsFixed(2)),
      DepartmentModel(
          name: 'Cost of Miscellaneous',
          routeName: MiscellaneousItemListScreen.routeName,
          total: miscellaneousData.totalItemCost.toStringAsFixed(2)),
    ];
    const subDepartmentNumber = ['two', 'four', 'zero', 'zero', 'zero', 'zero'];
    return Card(
      color: Colors.blue[50],
      elevation: 10,
      child: ExpansionTile(
          subtitle: Text(
              'This has ' + subDepartmentNumber[index] + ' Sub Departments'),
          title: Text(
            departmentNames.keys.toList()[index],
            style: TextStyle(fontSize: 25),
          ),
          trailing: Icon(Icons.arrow_drop_down_circle),
          children: [
            ...(departmentNames.values.toList()[index]).map((e) {
              DepartmentModel value =
                  modelData.firstWhere((element) => e == element.name);
              return Card(
                  elevation: 3,
                  color: Colors.blue[100],
                  child: ListTile(
                    trailing: Chip(
                      backgroundColor: Colors.blue,
                      elevation: 5,
                      shadowColor: Colors.amber,
                      label: Text('\$' + value.total,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, value.routeName);
                    },
                    title: Text(e, style: TextStyle(fontSize: 20)),
                  ));
            })
          ]),
    );
  }
}

class DepartmentModel {
  final String name;
  final String total;
  final String routeName;
  DepartmentModel({this.name, this.total, this.routeName});
}
