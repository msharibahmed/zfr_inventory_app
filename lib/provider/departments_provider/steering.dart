import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/item_model.dart';

class SteeringProvider with ChangeNotifier {
  List<ItemModel> _items = [
    ItemModel(
      itemId: 'p4',
      itemName: 'A Pan',
      itemBuyer: 'Anas',
      itemDate: DateTime.now(),
      itemDescription: 'Prepare any meal you want.',
      itemQuantity: 1,
      itemVendor: 'Natonal ltd',
      itemCost: 49.99,
    ),
  ];

  double get jancost {
    var total = 0.0;
    var jan = _items.where(
        (element) => DateFormat('MMM').format(element.itemDate) == 'Jan');
    jan.forEach((element) {
      total += element.itemCost * element.itemQuantity;
    });
    return total;
  }

  double get febcost {
    var total = 0.0;
    var feb = _items.where(
        (element) => DateFormat('MMM').format(element.itemDate) == 'Feb');
    feb.forEach((element) {
      total += element.itemCost * element.itemQuantity;
    });

    return total;
  }

  double get marcost {
    var total = 0.0;
    var mar = _items.where(
        (element) => DateFormat('MMM').format(element.itemDate) == 'Mar');
    mar.forEach((element) {
      total += element.itemCost * element.itemQuantity;
    });
    return total;
  }

  double get aprcost {
    var total = 0.0;
    var apr = _items.where(
        (element) => DateFormat('MMM').format(element.itemDate) == 'Apr');
    apr.forEach((element) {
      total += element.itemCost * element.itemQuantity;
    });
    return total;
  }

  double get maycost {
    var total = 0.0;
    var jan = _items.where(
        (element) => DateFormat('MMM').format(element.itemDate) == 'May');
    jan.forEach((element) {
      total += element.itemCost * element.itemQuantity;
    });
    return total;
  }

  double get juncost {
    var total = 0.0;
    var jun = _items.where(
        (element) => DateFormat('MMM').format(element.itemDate) == 'Jun');
    jun.forEach((element) {
      total += element.itemCost * element.itemQuantity;
    });
    return total;
  }

  double get julcost {
    var total = 0.0;
    var jul = _items.where(
        (element) => DateFormat('MMM').format(element.itemDate) == 'Jul');
    jul.forEach((element) {
      total += element.itemCost * element.itemQuantity;
    });
    return total;
  }

  double get augcost {
    var total = 0.0;
    var aug = _items.where(
        (element) => DateFormat('MMM').format(element.itemDate) == 'Aug');
    aug.forEach((element) {
      total += element.itemCost * element.itemQuantity;
    });
    return total;
  }

  double get sepcost {
    var total = 0.0;
    var sep = _items.where(
        (element) => DateFormat('MMM').format(element.itemDate) == 'Sep');
    sep.forEach((element) {
      total += element.itemCost * element.itemQuantity;
    });
    return total;
  }

  double get octcost {
    var total = 0.0;
    var oct = _items.where(
        (element) => DateFormat('MMM').format(element.itemDate) == 'Oct');
    oct.forEach((element) {
      total += element.itemCost * element.itemQuantity;
    });
    return total;
  }

  double get novcost {
    var total = 0.0;
    var nov = _items.where(
        (element) => DateFormat('MMM').format(element.itemDate) == 'Nov');
    nov.forEach((element) {
      total += element.itemCost * element.itemQuantity;
    });
    return total;
  }

  double get deccost {
    var total = 0.0;
    var dec = _items.where(
        (element) => DateFormat('MMM').format(element.itemDate) == 'Dec');
    dec.forEach((element) {
      total += element.itemCost * element.itemQuantity;
    });
    return total;
  }

  void deleteItem(String id) {
    ItemModel itemToDelete =
        _items.firstWhere((element) => element.itemId == id);
    _items.remove(itemToDelete);
    notifyListeners();
  }

  void undoDelete(int index, ItemModel deletedItem) {
    _items.insert(index, deletedItem);
    notifyListeners();
  }

  List<ItemModel> get items => [..._items];
  double get totalItemCost {
    var totalCost = 0.0;
    if (_items.isEmpty) {
      return totalCost = 0.0;
    } else {
      _items.forEach((element) {
        totalCost += (element.itemCost * element.itemQuantity);
      });
      return totalCost;
    }
  }

  void addItem(ItemModel itemModel) {
    final item = ItemModel(
        itemId: DateTime.now().toIso8601String(),
        itemName: itemModel.itemName,
        itemBuyer: itemModel.itemBuyer,
        itemDate: itemModel.itemDate,
        itemQuantity: itemModel.itemQuantity,
        itemVendor: itemModel.itemVendor,
        itemDescription: itemModel.itemDescription,
        itemCost: itemModel.itemCost);
    _items.add(item);
    notifyListeners();
  }
}
