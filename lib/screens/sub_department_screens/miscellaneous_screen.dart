import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../main_imports.dart';
import '../../provider/departments_provider/miscellaneous.dart';
import '../../widgets/item_card.dart';
import '../add_item_screen.dart';

class MiscellaneousItemListScreen extends StatefulWidget {
  static const routeName = 'miscellaneous-item-list-screen';

  @override
  _MiscellaneousItemListScreenState createState() =>
      _MiscellaneousItemListScreenState();
}

class _MiscellaneousItemListScreenState
    extends State<MiscellaneousItemListScreen> {
  var _boolCheck = true;
  var _boolCheck2 = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_boolCheck2 == true) {
      Provider.of<MiscellaneousProvider>(context, listen: false)
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
    return Provider.of<MiscellaneousProvider>(context, listen: false)
        .fetchItems(context);
  }

  @override
  Widget build(BuildContext context) {
    final itemData = Provider.of<MiscellaneousProvider>(
      context,
    );
    return Scaffold(
      floatingActionButton:
          Provider.of<Auth>(context, listen: false).email == null
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
              label: Consumer<MiscellaneousProvider>(
                builder: (context, data, _) => Text(
                    '\₹' + itemData.totalItemCost.toStringAsFixed(2),
                    style: TextStyle(color: Colors.white)),
              ))
        ],
      ),
      body: Consumer<MiscellaneousProvider>(
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
