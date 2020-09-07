import 'package:flutter/material.dart';

import '../widgets/drawer_widget.dart';



class HomeScreen extends StatelessWidget {
    static const routeName = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: DrawerWidget(),),
      appBar: AppBar(title:Text('ZFR Inventory')),
      
    );
  }
}