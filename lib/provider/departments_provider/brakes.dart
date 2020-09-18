import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zfr_inventory_app/main_imports.dart';

import '../../models/item_model.dart';

class ProviderModel with ChangeNotifier{
  List<double> va(List<ItemModel> _items) {
    Map<String, double> mon = {
      'Jan': 0,
      'feb': 0,
      'Mar': 0,
      'Apr': 0,
      'May': 0,
      'Jun': 0,
      'Jul': 0,
      'Aug': 0,
      'Sep': 0,
      'Oct': 0,
      'Nov': 0,
      'Dec': 0,
    };
    _items.forEach((element) {
      mon.forEach((k, v) {
        if (DateFormat('MMM').format(element.itemDate) == k) {
          v += element.itemCost * element.itemQuantity;
          // print(v);
          mon.update(k, (value) => value = v);
        }
      });
    });
    return mon.values.toList();
  }

  void deleteItem(String id, List<ItemModel> _items) {
    ItemModel itemToDelete =
        _items.firstWhere((element) => element.itemId == id);
    _items.remove(itemToDelete);
  }

  void undoDelete(int index, ItemModel deletedItem, List<ItemModel> _items) {
    _items.insert(index, deletedItem);
  }

  double totalItemCost(List<ItemModel> _items) {
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

  Future<void> addItem(ItemModel itemModel, BuildContext context,
      List<ItemModel> _items, String name) async {
    final url = 'https://zfr-inventory.firebaseio.com/department/$name.json';
    final date = itemModel.itemDate;
    try {
      final response = await http.post(url,
          body: jsonEncode({
            'itemName': itemModel.itemName,
            'itemBuyer': itemModel.itemBuyer,
            'itemDate': date.toIso8601String(),
            'itemQuantity': itemModel.itemQuantity,
            'itemVendor': itemModel.itemVendor,
            'itemDescription': itemModel.itemDescription,
            'itemCost': itemModel.itemCost,
          }));
      final postData = jsonDecode(response.body);
      // print(postData);

      final item = ItemModel(
          itemId: postData['name'],
          itemName: itemModel.itemName,
          itemBuyer: itemModel.itemBuyer,
          itemDate: date,
          itemQuantity: itemModel.itemQuantity,
          itemVendor: itemModel.itemVendor,
          itemDescription: itemModel.itemDescription,
          itemCost: itemModel.itemCost);
      _items.add(item);
    } catch (error) {
      print(error);
      await showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text('Error Occured!'),
              content: Text('Check Your connection or contact developer.'),
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

  // Future<void> fetchItems(
  //     BuildContext context, List<ItemModel> _items, String name) async {
  //   final url = 'https://zfr-inventory.firebaseio.com/department/$name.json';
  //   try {
  //     final response = await http.get(url);
  //     final getResponse = (jsonDecode(response.body)) as Map<String, dynamic>;
  //     final List<ItemModel> temp = [];

  //     getResponse.forEach((itemId, item) {
  //       temp.add(ItemModel(
  //           itemId: itemId,
  //           itemName: item['itemName'],
  //           itemBuyer: item['itemBuyer'],
  //           itemDate: DateTime.parse(item['itemDate']),
  //           itemDescription: item['itemDescription'],
  //           itemQuantity: item['itemQuantity'],
  //           itemVendor: item['itemVendor'],
  //           itemCost: item['itemCost']));
  //     });

  //     _items = temp;
  //   } catch (error) {
  //     print(error);
  //     await showDialog(
  //         context: context,
  //         builder: (ctx) {
  //           return AlertDialog(
  //             title: Text('Error Occured!'),
  //             content: Text('Check Your connection or contact developer.'),
  //             actions: [
  //               RaisedButton(
  //                 onPressed: () {
  //                   Navigator.pop(ctx);
  //                 },
  //                 child: Text('Okay!'),
  //               )
  //             ],
  //           );
  //         });
  //   }
   
  // }
}

class BrakesProvider with ChangeNotifier {
  List<ItemModel> _items = [];

  List<ItemModel> get items => [..._items];

  List<double> get va {
    return ProviderModel().va(_items);
  }

  void deleteItem(String id) {
    ProviderModel().deleteItem(id, _items);
    notifyListeners();
  }

  void undoDelete(int index, ItemModel deletedItem) {
    ProviderModel().undoDelete(index, deletedItem, _items);

    notifyListeners();
  }

  double get totalItemCost {
    return ProviderModel().totalItemCost(_items);
  }

  Future<void> addItem(ItemModel itemModel, BuildContext context) async {
    await ProviderModel().addItem(itemModel, context, _items, 'brakes');
    notifyListeners();
  }

  // Future<void> fetchItems(BuildContext context) async {
  //   await ProviderModel().fetchItems(context, _items, 'brakes');
  //   notifyListeners();
   
  // }

  Future<void> fetchItems(BuildContext context) async {
    const url = 'https://zfr-inventory.firebaseio.com/department/brakes.json';
    try {
      final response = await http.get(url);
      final getResponse = (jsonDecode(response.body)) as Map<String, dynamic>;
      final List<ItemModel> temp = [];
      if(getResponse!=null){
        
      getResponse.forEach((itemId, item) {
        temp.add(ItemModel(
            itemId: itemId,
            itemName: item['itemName'],
            itemBuyer: item['itemBuyer'],
            itemDate: DateTime.parse(item['itemDate']),
            itemDescription: item['itemDescription'],
            itemQuantity: item['itemQuantity'],
            itemVendor: item['itemVendor'],
            itemCost: item['itemCost']));
      });

      _items = temp;
      notifyListeners();
      }
    } catch (error) {
      print(error);
      await showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text('Error Occured!'),
              content: Text('Check Your connection or contact developer.'),
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
}
