import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/setting_screen.dart';
import '../screens/department_screen.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Card drawerCard(String title, IconData iconData, String screenName) {
      return Card(
        elevation: 5,
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Icon(
            iconData,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);

            Navigator.pushNamed(context, screenName);
          },
        ),
      );
    }

    return Container(
      child: Column(children: [
        Container(
          width: double.infinity,
          height: 150,
          color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                        color: Colors.black,
                        child: Image.asset(
                          'assets/images/boyracer.png',
                          width: 60,
                          height: 60,
                        ))),
                SizedBox(
                  height: 10,
                ),
                Text('Sharob Ahmed',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 5,
                ),
                Text('msharbahmed@gmal.com',
                    style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ),
        drawerCard('Home', Icons.home, HomeScreen.routeName),
        drawerCard('Departments', Icons.domain, DepartmentScreen.routeName),
        drawerCard('Settings', Icons.settings, SettingScreen.routeName)
      ]),
    );
  }
}
