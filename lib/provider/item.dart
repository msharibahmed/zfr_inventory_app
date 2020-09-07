import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemModel {
  final String itemId;
  final String itemName;
  final DateTime itemDate;
  final double itemCost;
  final int itemQuantity;
  final String itemBuyer;
  final String itemVendor;
  final String itemDescription;

  ItemModel(
      {@required this.itemId,
      @required this.itemName,
      @required this.itemBuyer,
      @required this.itemDate,
      this.itemDescription = 'none',
      @required this.itemQuantity,
      @required this.itemVendor,
      @required this.itemCost});
}

class ItemProvider with ChangeNotifier {
  List<ItemModel> _items = [
    ItemModel(
      itemId: 'p1',
      itemName: 'Red Shirt',
      itemBuyer: 'Fahad',
      itemDate: DateTime.now(),
      itemDescription: 'A red shirt - it is pretty red!',
      itemQuantity: 1,
      itemVendor: 'Strng ltd',
      itemCost: 29.99,
    ),
    ItemModel(
      itemId: 'p2',
      itemName: 'Trousers',
      itemBuyer: 'Rehan',
      itemDate: DateTime.now(),
      itemDescription: 'A nice pair of trousers.',
      itemQuantity: 2,
      itemVendor: 'Furous part ltd',
      itemCost: 59.99,
    ),
    ItemModel(
      itemId: 'p3',
      itemName: 'Yellow Scarf',
      itemBuyer: 'Kamran',
      itemDate: DateTime.now(),
      itemDescription: 'Warm and cozy - exactly what you need for the winter.',
      itemQuantity: 3,
      itemVendor: 'Strng ltd',
      itemCost: 19.99,
    ),
    ItemModel(
      itemId: 'p4',
      itemName: 'A Pan',
      itemBuyer: 'Anas',
      itemDate: DateTime.now(),
      itemDescription: 'Prepare any meal you want.',
      itemQuantity: 4,
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
