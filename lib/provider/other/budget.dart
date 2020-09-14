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

  double get jandepcost {
    var value = SteeringProvider().jancost +
        SuspensionProvider().jancost +
        ExhaustProvider().jancost +
        CoolingProvider().jancost +
        IntakeProvider().jancost +
        DriveTrainProvider().jancost +
        BrakesProvider().jancost +
        ChassisProvider().jancost +
        ElectronicsProvider().jancost +
        MiscellaneousProvider().jancost;
    return double.parse(value.toStringAsFixed(2));
  }

  double get febdepcost {
    var value = SteeringProvider().febcost +
        SuspensionProvider().febcost +
        ExhaustProvider().febcost +
        CoolingProvider().febcost +
        IntakeProvider().febcost +
        DriveTrainProvider().febcost +
        BrakesProvider().febcost +
        ChassisProvider().febcost +
        ElectronicsProvider().febcost +
        MiscellaneousProvider().febcost;

    return double.parse(value.toStringAsFixed(2));
  }

  double get mardepcost {
    var value = SteeringProvider().marcost +
        SuspensionProvider().marcost +
        ExhaustProvider().marcost +
        CoolingProvider().marcost +
        IntakeProvider().marcost +
        DriveTrainProvider().marcost +
        BrakesProvider().marcost +
        ChassisProvider().marcost +
        ElectronicsProvider().marcost +
        MiscellaneousProvider().marcost;
    return double.parse(value.toStringAsFixed(2));
  }

  double get aprdepcost {
    var value = SteeringProvider().aprcost +
        SuspensionProvider().aprcost +
        ExhaustProvider().aprcost +
        CoolingProvider().aprcost +
        IntakeProvider().aprcost +
        DriveTrainProvider().aprcost +
        BrakesProvider().aprcost +
        ChassisProvider().aprcost +
        ElectronicsProvider().aprcost +
        MiscellaneousProvider().aprcost;
    return double.parse(value.toStringAsFixed(2));
  }

  double get maydepcost {
    var value = SteeringProvider().maycost +
        SuspensionProvider().maycost +
        ExhaustProvider().maycost +
        CoolingProvider().maycost +
        IntakeProvider().maycost +
        DriveTrainProvider().maycost +
        BrakesProvider().maycost +
        ChassisProvider().maycost +
        ElectronicsProvider().maycost +
        MiscellaneousProvider().maycost;
    return double.parse(value.toStringAsFixed(2));
  }

  double get jundepcost {
    var value = SteeringProvider().juncost +
        SuspensionProvider().juncost +
        ExhaustProvider().juncost +
        CoolingProvider().juncost +
        IntakeProvider().juncost +
        DriveTrainProvider().juncost +
        BrakesProvider().juncost +
        ChassisProvider().juncost +
        ElectronicsProvider().juncost +
        MiscellaneousProvider().juncost;
    return double.parse(value.toStringAsFixed(2));
  }

  double get juldepcost {
    var value = SteeringProvider().julcost +
        SuspensionProvider().julcost +
        ExhaustProvider().julcost +
        CoolingProvider().julcost +
        IntakeProvider().julcost +
        DriveTrainProvider().julcost +
        BrakesProvider().julcost +
        ChassisProvider().julcost +
        ElectronicsProvider().julcost +
        MiscellaneousProvider().julcost;
    return double.parse(value.toStringAsFixed(2));
  }

  double get augdepcost {
    var value = SteeringProvider().augcost +
        SuspensionProvider().augcost +
        ExhaustProvider().augcost +
        CoolingProvider().augcost +
        IntakeProvider().augcost +
        DriveTrainProvider().augcost +
        BrakesProvider().augcost +
        ChassisProvider().augcost +
        ElectronicsProvider().augcost +
        MiscellaneousProvider().augcost;
    return double.parse(value.toStringAsFixed(2));
  }

  double get sepdepcost {
    var value = SteeringProvider().sepcost +
        SuspensionProvider().sepcost +
        ExhaustProvider().sepcost +
        CoolingProvider().sepcost +
        IntakeProvider().sepcost +
        DriveTrainProvider().sepcost +
        BrakesProvider().sepcost +
        ChassisProvider().sepcost +
        ElectronicsProvider().sepcost +
        MiscellaneousProvider().sepcost;
    return double.parse(value.toStringAsFixed(2));
  }

  double get octdepcost {
    var value = SteeringProvider().octcost +
        SuspensionProvider().octcost +
        ExhaustProvider().octcost +
        CoolingProvider().octcost +
        IntakeProvider().octcost +
        DriveTrainProvider().octcost +
        BrakesProvider().octcost +
        ChassisProvider().octcost +
        ElectronicsProvider().octcost +
        MiscellaneousProvider().octcost;
    return double.parse(value.toStringAsFixed(2));
  }

  double get novdepcost {
    var value = SteeringProvider().novcost +
        SuspensionProvider().novcost +
        ExhaustProvider().novcost +
        CoolingProvider().novcost +
        IntakeProvider().novcost +
        DriveTrainProvider().novcost +
        BrakesProvider().novcost +
        ChassisProvider().novcost +
        ElectronicsProvider().novcost +
        MiscellaneousProvider().novcost;
    return double.parse(value.toStringAsFixed(2));
  }

  double get decdepcost {
    var value = SteeringProvider().deccost +
        SuspensionProvider().deccost +
        ExhaustProvider().deccost +
        CoolingProvider().deccost +
        IntakeProvider().deccost +
        DriveTrainProvider().deccost +
        BrakesProvider().deccost +
        ChassisProvider().deccost +
        ElectronicsProvider().deccost +
        MiscellaneousProvider().deccost;
    return double.parse(value.toStringAsFixed(2));
  }
}
