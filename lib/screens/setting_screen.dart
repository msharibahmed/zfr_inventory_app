import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:zfr_inventory_app/main_imports.dart';

class SettingScreen extends StatefulWidget {
  static const routeName = 'setting-screen';

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var _boolCheck = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _boolCheck?Colors.white:Colors.black,
        // drawer: Drawer(child:DrawerWidget()),
        appBar: AppBar(title: Text('Settings')),
        body: Center(
            child: GestureDetector(
          onTap: () {
            setState(() {
              _boolCheck = !_boolCheck;
            });
          },
          child: Container(
            height: 110,
            width:110,
            child: FlareActor('assets/images/switch_daytime.flr',
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: _boolCheck?"day_idle":"night_idle"),
          ),
        )));
  }
}
