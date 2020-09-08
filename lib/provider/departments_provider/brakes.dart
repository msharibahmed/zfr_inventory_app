import 'package:flutter/material.dart';

import '../../models/item_model.dart';

class BrakesProvider with ChangeNotifier {
  List<ItemModel> _items = [
    ItemModel(
      itemId: 'p4',
      itemName: 'A Pan',
      itemBuyer: 'Anas',
      itemDate: DateTime.now(),
      itemDescription: 'Prepare any meal you want.',
      itemQuantity: 7,
      itemVendor: 'Natonal ltd',
      itemCost: 49.99,
    ),
  ];
  List<ItemModel> get items => [..._items];

  void deleteItem(String id) {
    ItemModel itemToDelete =
        _items.firstWhere((element) => element.itemId == id);
    _items.remove(itemToDelete);
    notifyListeners();
  }

  void undoDelete(int index,ItemModel deletedItem) {
    _items.insert(index,deletedItem);
    notifyListeners();
  }

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
}
