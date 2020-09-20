import 'package:flutter/material.dart';

import '../main_imports.dart';
import '../widgets/department_card.dart';

class DepartmentScreen extends StatefulWidget {
  static const routeName = 'department-screen';

  @override
  _DepartmentScreenState createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: DepartmentCard(index),
        ),
        itemCount: 6,
      ),
    ));
  }
}
