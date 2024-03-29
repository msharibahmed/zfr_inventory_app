import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../main_imports.dart';

class SteeringProvider with ChangeNotifier {
  final String token;
  SteeringProvider(this.token, this._items);
  List<ItemModel> _items = [];

  List<ItemModel> get items => [..._items];
  List<double> get va {
    return ProviderModel(token).va(_items);
  }

  Future<void> deleteItem(String id, BuildContext context) async {
    await ProviderModel(token).deleteItem(context, id, _items, 'steering');
    notifyListeners();
  }

  Future<void> undoDelete(
      BuildContext context, int index, ItemModel deletedItem) async {
    await ProviderModel(token)
        .undoDelete(context, index, deletedItem, _items, 'steering');

    notifyListeners();
  }

  double get totalItemCost {
    return ProviderModel(token).totalItemCost(_items);
  }

  Future<void> addItem(ItemModel itemModel, BuildContext context) async {
    await ProviderModel(token).addItem(itemModel, context, _items, 'steering');
    notifyListeners();
  }

  Future<void> fetchItems(BuildContext context) async {
    final url =
        'https://zfr-inventory.firebaseio.com/department/steering.json?auth=$token';
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
                ElevatedButton(
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
