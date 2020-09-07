import 'package:flutter/material.dart';

import '../screens/item_list_screen.dart';

class DepartmentCard extends StatelessWidget {
  final int index;

  DepartmentCard(this.index);
  @override
  Widget build(BuildContext context) {
    const Map<String, List> departmentNames = {
      'Vehicle Dynamics': ['Steering', 'Suspension'],
      'Power Train': ['Cooling', 'Drive Train', 'Exhaust', 'Intake'],
      'Brakes': [],
      'Chassis': [],
      'Electronics': [],
      'Miscellaneous': []
    };
    const subDepartmentNumber=['two','four','zero','zero','zero','zero'];
    return Card(
      color: Colors.blue[50],
      elevation: 10,
      child: ExpansionTile(
        subtitle: Text('This has '+subDepartmentNumber[index]+ ' Sub Departments') ,
          title: Text(
            departmentNames.keys.toList()[index],
            style: TextStyle(fontSize: 25),
            
          ),
          trailing: Icon(Icons.arrow_drop_down_circle),
          children: [
            ...(departmentNames.values.toList()[index]).map((e) => Card(
                elevation: 3,
                color: Colors.blue[100],
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, ItemListScreen.routeName);
                  },
                  title: Text(e, style: TextStyle(fontSize: 20)),
                )))
          ]),
    );
  }
}
