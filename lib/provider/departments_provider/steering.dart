import 'package:flutter/material.dart';

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
  // List<ItemModel> _suspensionItems = [
  //   ItemModel(
  //     itemId: 'q1',
  //     itemName: 'Red Shirt',
  //     itemBuyer: 'Fahad',
  //     itemDate: DateTime.now(),
  //     itemDescription: 'A red shirt - it is pretty red!',
  //     itemQuantity: 2,
  //     itemVendor: 'Strng ltd',
  //     itemCost: 9.99,
  //   ),
  // ];
  // List<ItemModel> _exhaustItems = [
  //   ItemModel(
  //     itemId: 'p2',
  //     itemName: 'Trousers',
  //     itemBuyer: 'Rehan',
  //     itemDate: DateTime.now(),
  //     itemDescription: 'A nice pair of trousers.',
  //     itemQuantity: 2,
  //     itemVendor: 'Furous part ltd',
  //     itemCost: 59.99,
  //   ),
  // ];

  // List<ItemModel> _coolingItems = [
  //   ItemModel(
  //     itemId: 'p2',
  //     itemName: 'Trousers',
  //     itemBuyer: 'Rehan',
  //     itemDate: DateTime.now(),
  //     itemDescription: 'A nice pair of trousers.',
  //     itemQuantity: 2,
  //     itemVendor: 'Furous part ltd',
  //     itemCost: 59.99,
  //   ),
  // ];

  // List<ItemModel> _driveTrainItems = [
  //   ItemModel(
  //     itemId: 'p2',
  //     itemName: 'Trousers',
  //     itemBuyer: 'Rehan',
  //     itemDate: DateTime.now(),
  //     itemDescription: 'A nice pair of trousers.',
  //     itemQuantity: 2,
  //     itemVendor: 'Furous part ltd',
  //     itemCost: 59.99,
  //   ),
  // ];

  // List<ItemModel> _intakItems = [
  //   ItemModel(
  //     itemId: 'p2',
  //     itemName: 'Trousers',
  //     itemBuyer: 'Rehan',
  //     itemDate: DateTime.now(),
  //     itemDescription: 'A nice pair of trousers.',
  //     itemQuantity: 2,
  //     itemVendor: 'Furous part ltd',
  //     itemCost: 59.99,
  //   ),
  // ];

  // List<ItemModel> _brakeItems = [
  //   ItemModel(
  //     itemId: 'p2',
  //     itemName: 'Trousers',
  //     itemBuyer: 'Rehan',
  //     itemDate: DateTime.now(),
  //     itemDescription: 'A nice pair of trousers.',
  //     itemQuantity: 2,
  //     itemVendor: 'Furous part ltd',
  //     itemCost: 59.99,
  //   ),
  // ];

  // List<ItemModel> _chassisItems = [
  //   ItemModel(
  //     itemId: 'p2',
  //     itemName: 'Trousers',
  //     itemBuyer: 'Rehan',
  //     itemDate: DateTime.now(),
  //     itemDescription: 'A nice pair of trousers.',
  //     itemQuantity: 2,
  //     itemVendor: 'Furous part ltd',
  //     itemCost: 59.99,
  //   ),
  // ];

  // List<ItemModel> _electronicsItems = [
  //   ItemModel(
  //     itemId: 'p2',
  //     itemName: 'Trousers',
  //     itemBuyer: 'Rehan',
  //     itemDate: DateTime.now(),
  //     itemDescription: 'A nice pair of trousers.',
  //     itemQuantity: 2,
  //     itemVendor: 'Furous part ltd',
  //     itemCost: 59.99,
  //   ),
  // ];

  // List<ItemModel> _miscellaneousItems = [
  //   ItemModel(
  //     itemId: 'p2',
  //     itemName: 'Trousers',
  //     itemBuyer: 'Rehan',
  //     itemDate: DateTime.now(),
  //     itemDescription: 'A nice pair of trousers.',
  //     itemQuantity: 2,
  //     itemVendor: 'Furous part ltd',
  //     itemCost: 59.99,
  //   ),
  // ];

  List<ItemModel> get items => [..._items];
//   List<ItemModel> get suspensionItems => [..._suspensionItems];

//   List<ItemModel> get exhaustItems => [..._exhaustItems];

//   List<ItemModel> get coolingItems => [..._coolingItems];

//   List<ItemModel> get driveTrainItems => [..._driveTrainItems];

//   List<ItemModel> get intakeItems => [..._intakItems];

//   List<ItemModel> get brakesItems => [..._brakeItems];
//   List<ItemModel> get chassisItems => [..._chassisItems];

//   List<ItemModel> get electronicsItems => [..._electronicsItems];

//   List<ItemModel> get miscellaneousItems => [..._miscellaneousItems];
// //taking numbers from 1 to 10 after totalItemCost as each respectve totalItemCost
  double get totalItemCost {
    var totalCost = 0.0;

    _items.forEach((element) {
      totalCost += (element.itemCost * element.itemQuantity);
    });
    return totalCost;
  }

//   double get totalItemCost2 {
//     var totalCost = 0.0;

//     _suspensionItems.forEach((element) {
//       totalCost += (element.itemCost * element.itemQuantity);
//     });
//     return totalCost;
//   }

//   double get totalItemCost3 {
//     var totalCost = 0.0;

//     _exhaustItems.forEach((element) {
//       totalCost += (element.itemCost * element.itemQuantity);
//     });
//     return totalCost;
//   }

//   double get totalItemCost4 {
//     var totalCost = 0.0;

//     _coolingItems.forEach((element) {
//       totalCost += (element.itemCost * element.itemQuantity);
//     });
//     return totalCost;
//   }

//   double get totalItemCost5 {
//     var totalCost = 0.0;

//     _driveTrainItems.forEach((element) {
//       totalCost += (element.itemCost * element.itemQuantity);
//     });
//     return totalCost;
//   }

//   double get totalItemCost6 {
//     var totalCost = 0.0;

//     _intakItems.forEach((element) {
//       totalCost += (element.itemCost * element.itemQuantity);
//     });
//     return totalCost;
//   }

//   double get totalItemCost7 {
//     var totalCost = 0.0;

//     _brakeItems.forEach((element) {
//       totalCost += (element.itemCost * element.itemQuantity);
//     });
//     return totalCost;
//   }

//   double get totalItemCost8 {
//     var totalCost = 0.0;

//     _chassisItems.forEach((element) {
//       totalCost += (element.itemCost * element.itemQuantity);
//     });
//     return totalCost;
//   }

//   double get totalItemCost9 {
//     var totalCost = 0.0;

//     _electronicsItems.forEach((element) {
//       totalCost += (element.itemCost * element.itemQuantity);
//     });
//     return totalCost;
//   }

 
}
