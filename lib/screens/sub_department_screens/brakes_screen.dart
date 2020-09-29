import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zfr_inventory_app/screens/add_item_screen.dart';

import '../../main_imports.dart';
import '../../provider/departments_provider/brakes.dart';
import '../../widgets/item_card.dart';

class BrakesItemListScreen extends StatefulWidget {
  static const routeName = 'brakes-item-list-screen';

  @override
  _BrakesItemListScreenState createState() => _BrakesItemListScreenState();
}

class _BrakesItemListScreenState extends State<BrakesItemListScreen> {
  var _boolCheck = true;
  var _boolCheck2 = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_boolCheck2 == true) {
      Provider.of<BrakesProvider>(context, listen: false)
          .fetchItems(context)
          .then((_) {
        setState(() {
          _boolCheck = false;
        });
      });
      _boolCheck2 = false;
    }
  }

  Future<void> refreshFetch() {
    return Provider.of<BrakesProvider>(context, listen: false)
        .fetchItems(context);
  }

  @override
  Widget build(BuildContext context) {
    final itemData = Provider.of<BrakesProvider>(context, listen: false);

    return Scaffold(
      floatingActionButton:
          Provider.of<Auth>(context, listen: false).email == null
              ? null
              : FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => AddItemScreen(itemData.addItem)));
                  },
                  child:const Icon(Icons.add),
                ),
      appBar: AppBar(
        title: const Text('Items'),
        actions: [
          Chip(
              elevation: 10,
              shadowColor: Colors.amber,
              backgroundColor: Colors.blue[900],
              label: Consumer<BrakesProvider>(
                builder: (context, data, _) => Text(
                    '\₹' + itemData.totalItemCost.toStringAsFixed(2),
                    style:const TextStyle(color: Colors.white)),
              ))
        ],
      ),
      body: Consumer<BrakesProvider>(
          builder: (context, value, child) => RefreshIndicator(
                onRefresh: refreshFetch,
                child: _boolCheck
                    ? Align(
                        alignment: Alignment.topCenter,
                        child:const CircularProgressIndicator())
                    : value.items.length == 0
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               const Icon(
                                  Icons.hot_tub,
                                  size: 100,
                                ),
                               const Text(
                                    "Empty here, click on '+' button to add items")
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemBuilder: (context, index) => ItemCard(
                                itemData.items[index],
                                itemData.deleteItem,
                                itemData.undoDelete,
                                index),
                            itemCount: itemData.items.length,
                          ),
              )),
    );
  }
}
