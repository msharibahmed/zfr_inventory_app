import 'package:backdrop/backdrop.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import '../main_imports.dart';

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
            selectedIndex > 0
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
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Colors.blue[100],
          items: [
            BottomNavyBarItem(
                activeColor: Colors.red,
                icon: Icon(Icons.home),
                title: Text('Home',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold))),
            BottomNavyBarItem(
                activeColor: Colors.purpleAccent,
                icon: Icon(Icons.domain),
                title: Text(
                  'Department',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
            BottomNavyBarItem(
                activeColor: Colors.blue,
                icon: Consumer<TasksProv>(
                  builder: (context, data, child) => Badge(
                      child: Icon(Icons.assignment),
                      value: data.checkedLength.toString()),
                ),
                title: Text(
                  'Tasks',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ))
          ],
          selectedIndex: selectedIndex,
          onItemSelected: onItemTapped,
          
          // type: BottomNavigationBarType.shifting,
          // selectedItemColor: Colors.blue,
        ),
        backLayer: DrawerWidget(),
        frontLayer: widgetOptions[selectedIndex]);
  }
}
