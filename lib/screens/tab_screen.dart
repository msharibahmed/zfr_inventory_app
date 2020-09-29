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
                ?const Text('')
                : IconButton(
                    icon: button
                        ?  Icon(
                            Icons.ac_unit,
                            color: Colors.blue[200],
                          )
                        :const Icon(Icons.ac_unit),
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
                icon:const Icon(Icons.home),
                title:const Text('Home',
                    style:const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold))),
            BottomNavyBarItem(
                activeColor: Colors.purpleAccent,
                icon:const Icon(Icons.domain),
                title:const Text(
                  'Department',
                  style:const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
            BottomNavyBarItem(
                activeColor: Colors.blue,
                icon: Consumer<TasksProv>(
                  builder: (context, data, child) => Badge(
                      child:const Icon(Icons.assignment),
                      value: data.checkedLength.toString()),
                ),
                title:const Text(
                  'Tasks',
                  style: const TextStyle(
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
