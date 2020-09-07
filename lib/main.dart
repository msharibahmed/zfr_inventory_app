import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zfr_inventory_app/provider/item.dart';

import 'screens/home_screen.dart';
import 'screens/department_screen.dart';
import 'screens/setting_screen.dart';
import 'screens/item_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemProvider(),
      child: MaterialApp(
        home: HomeScreen(),
        routes: {
          HomeScreen.routeName: (contex) => HomeScreen(),
          DepartmentScreen.routeName: (contex) => DepartmentScreen(),
          SettingScreen.routeName: (contex) => SettingScreen(),
          ItemListScreen.routeName: (contex) => ItemListScreen(),
        },
      ),
    );
  }
}
