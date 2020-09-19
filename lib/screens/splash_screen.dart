import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:zfr_inventory_app/main_imports.dart';
import 'package:zfr_inventory_app/screens/tab_screen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override
  Widget build(BuildContext context) {
    
      final a = Provider.of<SteeringProvider>(context,listen: false);
      final b = Provider.of<SuspensionProvider>(context,listen: false);
      final c = Provider.of<ExhaustProvider>(context,listen: false);
      final d = Provider.of<CoolingProvider>(context,listen: false);
      final e = Provider.of<IntakeProvider>(context,listen: false);
      final f = Provider.of<DriveTrainProvider>(context,listen: false);
      final g = Provider.of<BrakesProvider>(context,listen: false);
      final h = Provider.of<ChassisProvider>(context,listen: false);
      final i = Provider.of<ElectronicsProvider>(context,listen: false);
      final j = Provider.of<MiscellaneousProvider>(context,listen: false);
          a.fetchItems(context);
      b.fetchItems(context);
      c.fetchItems(context);
      d.fetchItems(context);
      e.fetchItems(context);
      f.fetchItems(context);
      g.fetchItems(context);
      h.fetchItems(context);
      i.fetchItems(context);
      j.fetchItems(context);
    return SplashScreen(
        loadingText: Text(
          'Z       F       R',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        loaderColor: Colors.white,
        backgroundColor: Colors.black,
        photoSize: 200,
        seconds: 10,
        image: Image.asset('assets/images/splash.gif'),
        navigateAfterSeconds: TabScreen());
  }
}
