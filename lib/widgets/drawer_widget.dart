import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import '../screens/setting_screen.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListTile drawerList(String title, IconData iconData, String screenName) {
      return ListTile(
        onTap: () {
          Navigator.pushNamed(context, screenName);
        },
        leading: Icon(
          iconData,
          size: 60,
          color: Colors.black,
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 25),
        ),
      );
    }

    return Container(
      child: Column(children: [
        Container(
          width: double.infinity,
          height: 100,
          color: Colors.amber[700],
          child: Padding(
            padding: const EdgeInsets.only(top: 2.0, left: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(120),
                    child: Container(
                      color: Colors.black,
                      child: Image.asset(
                        'assets/images/boyracer.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7.0, left: 8.0),
                  child: Text('Sharob Ahmed' + '\n' + 'msharbahmed@gmal.com',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Spacer(),
                Card(
                  elevation: 5,
                  shadowColor: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom:8.0,right: 8.0),
                    child: IconButton(
                        icon: Icon(
                          Icons.settings,
                          size: 40,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingScreen()));
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(),
        ExpansionTile(
          subtitle: Text(
            'Click to see the note!',
            style: TextStyle(fontSize: 12),
          ),
          title: Text(
            'Note from the Developer',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                  'If the App crashes or show pop-up dialog saying error occured then please, check your Internet connection. If the problem still persists, try contacting the developer.'),
            )
          ],
          trailing: Icon(
            Icons.info,
            color: Colors.black,
          ),
        ),
        Divider(),
        Expanded(
          child: Container(
            color: Colors.amber,
            child: Column(
              children: [
                drawerList('Settings', Icons.settings, SettingScreen.routeName),
                Divider(
                  height: 15,
                ),
                drawerList('Logout', Icons.settings_power, SettingScreen.routeName),
                Divider(
                  height: 15,
                ),
               
              ],
            ),
          ),
        ),
        
      ]),
    );
  }
}
