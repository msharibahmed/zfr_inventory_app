import 'package:google_fonts/google_fonts.dart';

import '../main_imports.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  final IconData iconData;
  final String screenName;
  DrawerListTile(this.title, this.iconData, this.screenName);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, screenName);
      },
      leading: FaIcon(
        iconData,
        size: 40,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
