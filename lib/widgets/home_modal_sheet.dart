import 'package:zfr_inventory_app/main_imports.dart';

import 'package:flutter/material.dart';
import 'package:zfr_inventory_app/provider/other/budget.dart';

class HomeModalSheet extends StatefulWidget {
  @override
  _HomeModalSheetState createState() => _HomeModalSheetState();
}

class _HomeModalSheetState extends State<HomeModalSheet> {
  final textCtrl = TextEditingController();
  bool _validate = false;

  int _value = 1;
  var _boolCheck = true;
  @override
  void dispose() {
    super.dispose();
    textCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle txtstyle = TextStyle(fontWeight: FontWeight.bold);
    final budgetData = Provider.of<BudgetProv>(context, listen: false);

    return SingleChildScrollView(
      child: Container(
        color: Color(0xFF737373),
        child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
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
                            child: Text(" Power Train", style: txtstyle),
                            value: 3),
                        DropdownMenuItem(
                            child: Text(" Brakes", style: txtstyle), value: 4),
                        DropdownMenuItem(
                            child: Text(" Chassis", style: txtstyle), value: 5),
                        DropdownMenuItem(
                            child: Text(" Electronics", style: txtstyle),
                            value: 6),
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
                    controller: textCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      errorText: _validate ? 'Enter valid numbers.' : '',
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
                      onPressed: () async {
                        if (_value == 1 || textCtrl.text.isEmpty) {
                          Navigator.pop(context);
                        } else {
                          if (double.tryParse(textCtrl.text) == null) {
                            setState(() {
                              _validate = true;
                            });
                          } else {
                            setState(() {
                              _validate = false;
                            });

                            setState(() {
                              _boolCheck = false;
                            });
                            await budgetData.addBudget(
                                _value, double.parse(textCtrl.text),context);

                            Navigator.pop(context);
                          }
                          // print(_validate);
                        }
                      },
                      child: _boolCheck
                          ? Text('Add',
                              style: TextStyle(fontWeight: FontWeight.bold))
                          : CircularProgressIndicator(
                              strokeWidth: 2,
                              backgroundColor: Colors.white,
                            ),
                    ))
              ],
            )),
      ),
    );
  }
}
