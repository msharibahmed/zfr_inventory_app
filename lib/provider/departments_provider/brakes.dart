import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:zfr_inventory_app/main_imports.dart';

import '../../models/item_model.dart';
import '../other/provider_model.dart';


class BrakesProvider with ChangeNotifier {
  List<ItemModel> _items = [];

  List<ItemModel> get items => [..._items];

  List<double> get va {
    return ProviderModel().va(_items);
  }

  Future<void> deleteItem(String id, BuildContext context) async {
    await ProviderModel().deleteItem(context, id, _items, 'brakes');
    notifyListeners();
  }

  Future<void> undoDelete(BuildContext context,int index, ItemModel deletedItem) async{
   await ProviderModel().undoDelete(context,index, deletedItem, _items,'brakes');

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
      if (getResponse != null) {
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
  Future<void> fetchSplash(BuildContext context) async {
    const url = 'https://zfr-inventory.firebaseio.com/department/brakes.json';
    try {
      final response = await http.get(url);
      final getResponse = (jsonDecode(response.body)) as Map<String, dynamic>;
      final List<ItemModel> temp = [];
      if (getResponse != null) {
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
          Navigator.pop(context);
    }
  }
}
