import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zfr_inventory_app/provider/departments_provider/brakes.dart';
import 'package:zfr_inventory_app/provider/departments_provider/chassis.dart';
import 'package:zfr_inventory_app/provider/departments_provider/cooling.dart';
import 'package:zfr_inventory_app/provider/departments_provider/drive_train.dart';
import 'package:zfr_inventory_app/provider/departments_provider/electronics.dart';
import 'package:zfr_inventory_app/provider/departments_provider/exhaust.dart';
import 'package:zfr_inventory_app/provider/departments_provider/intake.dart';
import 'package:zfr_inventory_app/provider/departments_provider/miscellaneous.dart';
import 'package:zfr_inventory_app/provider/departments_provider/steering.dart';
import 'package:zfr_inventory_app/provider/departments_provider/suspension.dart';
import 'package:zfr_inventory_app/screens/sub_department_screens/brakes_screen.dart';
import 'package:zfr_inventory_app/screens/sub_department_screens/chassis_screen.dart';
import 'package:zfr_inventory_app/screens/sub_department_screens/cooling_screen.dart';
import 'package:zfr_inventory_app/screens/sub_department_screens/drive_train_screen.dart';
import 'package:zfr_inventory_app/screens/sub_department_screens/electronics_screen.dart';
import 'package:zfr_inventory_app/screens/sub_department_screens/exhaust_screen.dart';
import 'package:zfr_inventory_app/screens/sub_department_screens/intake_screen.dart';
import 'package:zfr_inventory_app/screens/sub_department_screens/miscellaneous_screen.dart';
import 'package:zfr_inventory_app/screens/sub_department_screens/suspension_screen.dart';

import 'screens/home_screen.dart';
import 'screens/department_screen.dart';
import 'screens/setting_screen.dart';
import 'screens/sub_department_screens/steering_screen.dart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SteeringProvider>(
            create: (_) => SteeringProvider()),
        ChangeNotifierProvider<SuspensionProvider>(
            create: (_) => SuspensionProvider()),
        ChangeNotifierProvider<ExhaustProvider>(
            create: (_) => ExhaustProvider()),
        ChangeNotifierProvider<CoolingProvider>(
            create: (_) => CoolingProvider()),
        ChangeNotifierProvider<DriveTrainProvider>(
            create: (_) => DriveTrainProvider()),
        ChangeNotifierProvider<IntakeProvider>(create: (_) => IntakeProvider()),
        ChangeNotifierProvider<BrakesProvider>(create: (_) => BrakesProvider()),
        ChangeNotifierProvider<ElectronicsProvider>(
            create: (_) => ElectronicsProvider()),
        ChangeNotifierProvider<ChassisProvider>(
            create: (_) => ChassisProvider()),
        ChangeNotifierProvider<MiscellaneousProvider>(
            create: (_) => MiscellaneousProvider()),
      ],
      child: MaterialApp(
        home: HomeScreen(),
        routes: {
          HomeScreen.routeName: (contex) => HomeScreen(),
          DepartmentScreen.routeName: (contex) => DepartmentScreen(),
          SettingScreen.routeName: (contex) => SettingScreen(),
          SteeringItemListScreen.routeName: (contex) =>
              SteeringItemListScreen(),
          SuspensionItemListScreen.routeName: (contex) =>
              SuspensionItemListScreen(),
          ExhaustItemListScreen.routeName: (contex) => ExhaustItemListScreen(),
          CoolingItemListScreen.routeName: (contex) => CoolingItemListScreen(),
          IntakeItemListScreen.routeName: (contex) => IntakeItemListScreen(),
          BrakesItemListScreen.routeName: (contex) => BrakesItemListScreen(),
          ElectronicsItemListScreen.routeName: (contex) =>
              ElectronicsItemListScreen(),
          MiscellaneousItemListScreen.routeName: (contex) =>
              MiscellaneousItemListScreen(),
          ChassisItemListScreen.routeName: (contex) => ChassisItemListScreen(),
          DriveTrainItemListScreen.routeName: (contex) =>
              DriveTrainItemListScreen(),
        },
      ),
    );
  }
}
