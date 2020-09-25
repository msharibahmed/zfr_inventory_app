import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:zfr_inventory_app/main_imports.dart';

class BudgetProv with ChangeNotifier {
  Map<int, double> _budgets = {2: 0.0, 3: 0.0, 4: 0.0, 5: 0.0, 6: 0.0, 7: 0.0};
  final String token;
  BudgetProv(this.token,this._budgets);
  Map<int, double> get budgets {
    return {..._budgets};
  }

  Future<void> addBudget(int id, double budget, BuildContext context) async {
    final url = 'https://zfr-inventory.firebaseio.com/budget/$id.json';

    try {
      await http.delete(url);
      final response1 =
          await http.post(url, body: jsonEncode({'budget': budget}));
      final postResponse = jsonDecode(response1.body);
      print(postResponse);

      _budgets.update(id, (value) => budget);
      notifyListeners();
    } catch (error) {
      print(error);
      await showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text('Connection Error!'),
              content:
                  Text('Couldn\'t Add Budget, Please Check Your Connection.'),
              actions: [
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: Text('Okay!'),
                )
              ],
            );
          });
    }
  }

  Future<void> fetchBudget(int id) async {
    final url = 'https://zfr-inventory.firebaseio.com/budget/$id.json?auth=$token';
    try {
      final response = await http.get(url);

      final getResponse = jsonDecode(response.body) as Map<String, dynamic>;
      // print(getResponse);
      if (getResponse == null) {
        return;
      } else {
        _budgets.update(
            id, (value) => getResponse.values.toList()[0]['budget']);
      }
    } catch (error) {
      print(error);
      throw error;
    }
    // _budgets.forEach((key, value) {
    //   if (key == id) {
    //     print(value);
    //   }
    // });
  }
}
