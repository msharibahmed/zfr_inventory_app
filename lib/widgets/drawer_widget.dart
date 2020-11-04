// import 'package:flare_flutter/flare_actor.dart';
// import 'package:google_fonts/google_fonts.dart';

import '../main_imports.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    // final mode = Provider.of<ThemeProv>(context);

    return Container(
      child: Column(children: [
        Container(
          width: double.infinity,
          height: 100,
          color: Colors.white,
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
                  child: Consumer<Auth>(
                    builder: (context, value, child) => Text(
                        value.email == null ? 'Anonymous Login' : value.email,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const Spacer(),
                Card(
                  elevation: 5,
                  shadowColor: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
                    child: IconButton(
                        icon: const Icon(
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
        const Divider(),
        ExpansionTile(
          backgroundColor: Colors.white,
          subtitle: const Text(
            'Click to see the note!',
            style: const TextStyle(fontSize: 12, color: Colors.red),
          ),
          title: const Text(
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
          trailing: const Icon(
            Icons.info,
            color: Colors.black,
          ),
        ),
        const Divider(),
        Expanded(
          child: Container(
              color: Colors.white,
              child: ListView(
                children: [
                  DrawerListTile('About Developer', FontAwesomeIcons.addressCard,
                      DeveloperScreen.routeName),
                  const Divider(
                    height: 10,
                  ),
                  DrawerListTile(
                    'About Us',
                    Icons.account_box,
                    AboutUs.routeName,
                  ),
                  const Divider(
                    height: 10,
                  ),
                  Consumer<Auth>(
                    builder: (context, auth, _) => ListTile(
                      onTap: () {
                        auth.logout();
                      },
                      leading: FaIcon(FontAwesomeIcons.signOutAlt, size: 40,color: Colors.black),
                      title: const Text(
                        'Log Out',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: mode.changeMode,
                  //   child: Container(
                  //     alignment: Alignment.bottomRight,
                  //     height: 50,
                  //     width: 50,
                  //     child: FlareActor('assets/images/switch_daytime.flr',
                  //         alignment: Alignment.bottomRight,
                  //         fit: BoxFit.contain,
                  //         animation: mode.mode ? "day_idle" : "night_idle"),
                  //   ),
                  // )
                ],
              )),
        ),
      ]),
    );
  }
}
