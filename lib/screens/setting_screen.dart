import 'package:flutter/material.dart';
import 'package:zfr_inventory_app/main_imports.dart';
import 'package:zfr_inventory_app/provider/other/budget.dart';

class SettingScreen extends StatefulWidget {
  static const routeName = 'setting-screen';

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  Future<void> fetch() async {
    final budget = Provider.of<BudgetProv>(context, listen: false);

    await budget.fetchBudget(2);
    await budget.fetchBudget(3);
    await budget.fetchBudget(4);
    await budget.fetchBudget(5);
    await budget.fetchBudget(6);
    await budget.fetchBudget(7);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        // drawer: Drawer(child:DrawerWidget()),
        appBar: AppBar(title: Text('Settings')),
        body: Center(
            child: OutlineButton(
          onPressed: fetch,
        )));
  }
}
