import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:zfr_inventory_app/main_imports.dart';
import 'package:zfr_inventory_app/provider/other/tasks.dart';
import 'package:zfr_inventory_app/widgets/badge_widget.dart';
import 'package:zfr_inventory_app/widgets/drawer_widget.dart';

import 'task_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int selectedIndex = 0;

  bool button = false;
  final names = ['Z F R  Inventory', 'Department', 'Tasks'];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final widgetOptions = [
      HomeScreen(button),
      DepartmentScreen(),
      TaskScreen()
    ];
    return BackdropScaffold(
        appBar: BackdropAppBar(
          title: Text(names[selectedIndex]),
          centerTitle: true,
          actions: [
            selectedIndex > 1
                ? Text('')
                : IconButton(
                    icon: button
                        ? Icon(
                            Icons.ac_unit,
                            color: Colors.blue[200],
                          )
                        : Icon(Icons.ac_unit),
                    onPressed: () {
                      setState(() {
                        button = !button;
                      });
                      // print(button);
                    })
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Colors.blue[100],
                  icon: Icon(Icons.home),
                  title: Text('Home',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold))),
              BottomNavigationBarItem(
                  backgroundColor: Colors.blue[200],
                  icon: Icon(Icons.domain),
                  title: Text(
                    'Department',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
              BottomNavigationBarItem(
                  backgroundColor: Colors.blue[300],
                  icon: Consumer<TasksProv>(
                    builder: (context, data, child) =>
                        Badge(child: Icon(Icons.assignment), value: data.checkedLength.toString()),
                  ),
                  title: Text(
                    'Tasks',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ))
            ],
            currentIndex: selectedIndex,
            onTap: onItemTapped,
            unselectedItemColor: Colors.deepOrange,
            type: BottomNavigationBarType.shifting,
            selectedItemColor: Colors.blue,
            backgroundColor: Colors.white),
        backLayer: DrawerWidget(),
        frontLayer: widgetOptions[selectedIndex]);
  }
}
