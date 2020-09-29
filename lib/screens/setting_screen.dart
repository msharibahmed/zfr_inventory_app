import 'package:flare_flutter/flare_actor.dart';
import 'package:zfr_inventory_app/main_imports.dart';

class SettingScreen extends StatefulWidget {
  static const routeName = 'setting-screen';

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
        final mode = Provider.of<ThemeProv>(context);

    return Scaffold(
      backgroundColor: mode.mode?Colors.white:Colors.black,
        // drawer: Drawer(child:DrawerWidget()),
        appBar:  AppBar(title:const Text('Settings')),
        body: Center(
            child: GestureDetector(
          onTap:mode.changeMode,
          child: Container(
            height: 110,
            width:110,
            child: FlareActor('assets/images/switch_daytime.flr',
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: mode.mode?"day_idle":"night_idle"),
          ),
        )));
  }
}
