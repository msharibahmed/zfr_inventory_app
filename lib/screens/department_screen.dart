import 'package:flutter/material.dart';

import '../widgets/department_card.dart';

class DepartmentScreen extends StatelessWidget {
  static const routeName = 'department-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Departments')),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: DepartmentCard(index),
            ),
            itemCount: 6,
          ),
        ));
  }
}
