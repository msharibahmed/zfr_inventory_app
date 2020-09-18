import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/departments_provider/cooling.dart';
import '../../widgets/item_card.dart';
import '../add_item_screen.dart';

class CoolingItemListScreen extends StatefulWidget {
  static const routeName = 'cooling-item-list-screen';

  @override
  _CoolingItemListScreenState createState() => _CoolingItemListScreenState();
}

class _CoolingItemListScreenState extends State<CoolingItemListScreen> {
var _boolCheck = true;
  var _boolCheck2 = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_boolCheck2 == true) {
      Provider.of<CoolingProvider>(context, listen: false)
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
    return Provider.of<CoolingProvider>(context, listen: false)
        .fetchItems(context);
  }  @override
  Widget build(BuildContext context) {
    final itemData = Provider.of<CoolingProvider>(context, );
    return Scaffold(
      floatingActionButton: FloatingActionButton(
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
              label: Consumer<CoolingProvider>(builder: (context,data,_)=>Text('\$'+itemData.totalItemCost.toStringAsFixed(2), style: TextStyle(color: Colors.white)),))
        ],
      ),
      body:Consumer<CoolingProvider>(
          builder: (context, value, child) => RefreshIndicator(
                onRefresh: refreshFetch,
                child: _boolCheck
                    ? Align(
                        alignment: Alignment.topCenter,
                        child: CircularProgressIndicator())
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
