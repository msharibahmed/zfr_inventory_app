import 'package:flutter/material.dart';
import 'package:zfr_inventory_app/main_imports.dart';
import 'package:zfr_inventory_app/widgets/drawer_widget.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int selectedIndex = 0;

  bool button = false;
  final names = ['Z F R  Inventory', 'Department'];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final widgetOptions = [HomeScreen(button), DepartmentScreen()];
    return Scaffold(
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      appBar: AppBar(
        title: Text(names[selectedIndex]),
        actions: [
          selectedIndex == 1
              ? Text('')
              : IconButton(
                  icon: Icon(Icons.ac_unit),
                  onPressed: () {
                    setState(() {
                      button = !button;
                    });
                    print(button);
                  })
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.home),
                title: Text('Home',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold))),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.domain),
                title: Text(
                  'Department',
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
      body: widgetOptions[selectedIndex],
    );
  }
}
