import '../main_imports.dart';

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
    TextStyle txtstyle = const TextStyle(fontWeight: FontWeight.bold);
    final budgetData = Provider.of<BudgetProv>(context, listen: false);
    DropdownMenuItem dropdownMenuItem(String name, int value) {
      return DropdownMenuItem(
        child: Text(name, style: txtstyle),
        value: value,
      );
    }

    return SingleChildScrollView(
      child: Container(
        color: Color(0xFF737373),
        child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(15),
                    topRight: const Radius.circular(15))),
            padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  margin: const EdgeInsets.all(5),
                  elevation: 5,
                  shadowColor: Colors.blue,
                  child: DropdownButton(
                      value: _value,
                      items: [
                        dropdownMenuItem(" Select Department", 1),
                        dropdownMenuItem(" Vehicle Dynamics", 2),
                        dropdownMenuItem(" Power Train", 3),
                        dropdownMenuItem(" Brakes", 4),
                        dropdownMenuItem(" Chassis", 5),
                        dropdownMenuItem(" Electronics", 6),
                        dropdownMenuItem(" Miscellaneous", 7),
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
                      icon: const Icon(
                        Icons.monetization_on,
                        color: Colors.red,
                        size: 30,
                      ),
                    )),
                Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style:TextButton.styleFrom(backgroundColor:Colors.black),
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
                                _value, double.parse(textCtrl.text), context);

                            Navigator.pop(context);
                          }
                          // print(_validate);
                        }
                      },
                      child: _boolCheck
                          ? Text('ADD',
                              style:const TextStyle(fontWeight: FontWeight.bold,color: Colors.white))
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
