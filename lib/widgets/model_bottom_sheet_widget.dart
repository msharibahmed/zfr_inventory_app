// import 'package:flutter/material.dart';
// class ModelBottomSheetWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:zfr_inventory_app/provider/departments_provider/steering.dart';

// import '../screens/item_list_screen.dart';

// class DepartmentCard extends StatelessWidget {
//   final int index;

//   DepartmentCard(this.index);
//   @override
//   Widget build(BuildContext context) {
//     final steeringData = Provider.of<SteeringProvider>(context);
//     const Map<String, List> departmentNames = {
//       'Vehicle Dynamics': ['Steering', 'Suspension'],
//       'Power Train': ['Cooling', 'Drive Train', 'Exhaust', 'Intake'],
//       'Brakes': [],
//       'Chassis': [''],
//       'Electronics': [''],
//       'Miscellaneous': ['']
//     };
//     const subDepartmentNumber = ['two', 'four', 'zero', 'zero', 'zero', 'zero'];
//     return Card(
//       color: Colors.blue[50],
//       elevation: 10,
//       child: ExpansionTile(
//           subtitle: Text(
//               'This has ' + subDepartmentNumber[index] + ' Sub Departments'),
//           title: Text(
//             departmentNames.keys.toList()[index],
//             style: TextStyle(fontSize: 25),
//           ),
//           trailing: Icon(Icons.arrow_drop_down_circle),
//           children:
//               // ...(departmentNames.values.toList()[index]).map((e) =>
//               [
//             Container(
//               height: 100,
//               child: ListView.builder(
//                 itemBuilder: (context, inx) => Card(
//                     elevation: 3,
//                     color: Colors.blue[100],
//                     child: ListTile(
//                       trailing: Chip(
//                         backgroundColor: Colors.blue,
//                         elevation: 5,
//                         shadowColor: Colors.amber,
//                         label: Text(
//                             '\$' +
//                                 steeringData.totalItemCost.toStringAsFixed(2),
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w600)),
//                       ),
//                       onTap: () {
//                         Navigator.pushNamed(context, ItemListScreen.routeName);
//                       },
//                       title: Text(departmentNames.values.toList()[index][inx],
//                           style: TextStyle(fontSize: 20)),
//                     )),
//                 itemCount: departmentNames.values.toList()[index].length,
//               ),
//             ),
//           ]),
//     );
//   }
// }
