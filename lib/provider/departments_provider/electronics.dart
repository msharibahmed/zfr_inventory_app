import 'package:flutter/material.dart';

import '../../models/item_model.dart';

class ElectronicsProvider with ChangeNotifier {
  List<ItemModel> _items = [
    ItemModel(
      itemId: 'p4',
      itemName: 'A Pan',
      itemBuyer: 'Anas',
      itemDate: DateTime.now(),
      itemDescription: 'Prepare any meal you want.',
      itemQuantity: 9,
      itemVendor: 'Natonal ltd',
      itemCost: 49.99,
    ),
  ];
    List<ItemModel> get items => [..._items];

  double get totalItemCost {
    var totalCost = 0.0;

    _items.forEach((element) {
      totalCost += (element.itemCost * element.itemQuantity);
    });
    return totalCost;
  }

}
