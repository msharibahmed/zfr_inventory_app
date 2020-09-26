import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../main_imports.dart';

class ProviderModel with ChangeNotifier {
 final String token;
  ProviderModel(this.token);
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

  Future<void> deleteItem(BuildContext context, String id,
      List<ItemModel> _items, String name) async {
    final url =
        'https://zfr-inventory.firebaseio.com/department/$name/$id.json?auth=$token';
    try {
      await http.delete(url);
      // final response = await http.delete(url);
      // print(response.statusCode);
    } catch (error) {
      print(error);
      throw await showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text('Couldn\'t Delete!'),
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

    ItemModel itemToDelete =
        _items.firstWhere((element) => element.itemId == id);
    _items.remove(itemToDelete);
  }

  Future<void> undoDelete(BuildContext context, int index,
      ItemModel deletedItem, List<ItemModel> _items, String name) async {
    final url = 'https://zfr-inventory.firebaseio.com/department/$name.json?auth=$token';
    try {
      final response = await http.post(url,
          body: jsonEncode({
            'itemName': deletedItem.itemName,
            'itemBuyer': deletedItem.itemBuyer,
            'itemDate': deletedItem.itemDate.toIso8601String(),
            'itemQuantity': deletedItem.itemQuantity,
            'itemVendor': deletedItem.itemVendor,
            'itemDescription': deletedItem.itemDescription,
            'itemCost': deletedItem.itemCost,
          }));
      final postData = jsonDecode(response.body);
      // print(postData);

      final item = ItemModel(
          itemId: postData['name'],
          itemName: deletedItem.itemName,
          itemBuyer: deletedItem.itemBuyer,
          itemDate: deletedItem.itemDate,
          itemQuantity: deletedItem.itemQuantity,
          itemVendor: deletedItem.itemVendor,
          itemDescription: deletedItem.itemDescription,
          itemCost: deletedItem.itemCost);

      _items.insert(index, item);
    } catch (error) {
      print(error);
      await showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text('Connection Error!'),
              content: Text('Couldn\'t Undo, Please Check Your Connection.'),
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
    final url = 'https://zfr-inventory.firebaseio.com/department/$name.json?auth=$token';
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
}
