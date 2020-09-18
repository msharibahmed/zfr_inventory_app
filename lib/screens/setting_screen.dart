import 'package:flutter/material.dart';
import 'package:zfr_inventory_app/main_imports.dart';
import 'package:zfr_inventory_app/widgets/drawer_widget.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = 'setting-screen';

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<SuspensionProvider>(context).va;
    return Scaffold(
      drawer: Drawer(child:DrawerWidget()),
      appBar: AppBar(title: Text('Settings')),
      body: ListView.builder(itemBuilder: (c, e) {
       return Text(p[e].toString());
      },itemCount: p.length),
    );
  }
}
