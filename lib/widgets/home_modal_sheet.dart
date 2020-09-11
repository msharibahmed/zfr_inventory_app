import 'package:zfr_inventory_app/main_imports.dart';

import 'package:flutter/material.dart';

class HomeModalSheet extends StatefulWidget {
  @override
  _HomeModalSheetState createState() => _HomeModalSheetState();
}

int _value = 1;

class _HomeModalSheetState extends State<HomeModalSheet> {

  @override
  Widget build(BuildContext context) {
    TextStyle txtstyle = TextStyle(fontWeight: FontWeight.bold);

    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              margin: EdgeInsets.all(5),
              elevation: 5,
              shadowColor: Colors.blue,
              child: DropdownButton(
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text(" Select Department", style: txtstyle),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text(" Vehicle Dynamics", style: txtstyle),
                      value: 2,
                    ),
                    DropdownMenuItem(
                        child: Text(" Power Train", style: txtstyle), value: 3),
                    DropdownMenuItem(
                        child: Text(" Brakes", style: txtstyle), value: 4),
                    DropdownMenuItem(
                        child: Text(" Chassis", style: txtstyle), value: 5),
                    DropdownMenuItem(
                        child: Text(" Electronics", style: txtstyle), value: 6),
                    DropdownMenuItem(
                        child: Text(" Miscellaneous", style: txtstyle),
                        value: 7),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  }),
            ),
            TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter Budget',
                  icon: Icon(
                    Icons.monetization_on,
                    color: Colors.red,
                    size: 30,
                  ),
                )),
            Container(
                alignment: Alignment.centerRight,
                child: FlatButton(
                    color: Colors.blue,
                    onPressed: () {},
                    child: Text(
                      'Add',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )))
          ],
        ));
  }
}
