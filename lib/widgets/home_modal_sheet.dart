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
    return Container(
        padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: DropdownButton(
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text("Select Department"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Vehicle Dynamics"),
                      value: 2,
                    ),
                    DropdownMenuItem(child: Text("Power Train"), value: 3),
                    DropdownMenuItem(child: Text("Brakes"), value: 4),
                    DropdownMenuItem(child: Text("Chassis"), value: 5),
                    DropdownMenuItem(child: Text("Electronics"), value: 6),
                    DropdownMenuItem(child: Text("Miscellaneous"), value: 7),
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
