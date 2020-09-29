import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main_imports.dart';
import '../../provider/departments_provider/exhaust.dart';
import '../../widgets/item_card.dart';
import '../add_item_screen.dart';

class ExhaustItemListScreen extends StatefulWidget {
  static const routeName = 'exhaust-item-list-screen';

  @override
  _ExhaustItemListScreenState createState() => _ExhaustItemListScreenState();
}

class _ExhaustItemListScreenState extends State<ExhaustItemListScreen> {
  var _boolCheck = true;
  var _boolCheck2 = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_boolCheck2 == true) {
      Provider.of<ExhaustProvider>(context, listen: false)
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
    return Provider.of<ExhaustProvider>(context, listen: false)
        .fetchItems(context);
  }

  @override
  Widget build(BuildContext context) {
    final itemData = Provider.of<ExhaustProvider>(
      context,
    );
    return Scaffold(
      floatingActionButton: Provider.of<Auth>(context, listen: false).email == null
              ? null
              : FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => AddItemScreen(itemData.addItem)));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Items'),
        actions: [
          Chip(
              elevation: 10,
              shadowColor: Colors.amber,
              backgroundColor: Colors.blue[900],
              label: Consumer<ExhaustProvider>(
                builder: (context, data, _) => Text(
                    '\₹' + itemData.totalItemCost.toStringAsFixed(2),
                    style: TextStyle(color: Colors.white)),
              ))
        ],
      ),
      body: Consumer<ExhaustProvider>(
          builder: (context, value, child) => RefreshIndicator(
                onRefresh: refreshFetch,
                child: _boolCheck
                    ? Align(
                        alignment: Alignment.topCenter,
                        child: CircularProgressIndicator())
                    : value.items.length == 0
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.hot_tub,
                                  size: 100,
                                ),
                                Text(
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
