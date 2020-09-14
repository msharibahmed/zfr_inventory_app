import 'package:flutter/material.dart';
import 'package:zfr_inventory_app/main_imports.dart';

class BudgetProv with ChangeNotifier {
  Map<int, double> _budgets = {2: 0.0, 3: 0.0, 4: 0.0, 5: 0.0, 6: 0.0, 7: 0.0};

  Map<int, double> get budgets {
    return {..._budgets};
  }

  void addBudget(int id, double budget) {
    _budgets.update(id, (value) => budget);
    notifyListeners();
  }
}
