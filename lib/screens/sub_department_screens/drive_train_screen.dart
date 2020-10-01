import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main_imports.dart';
import '../../provider/departments_provider/drive_train.dart';
import '../../widgets/item_card.dart';
import '../add_item_screen.dart';

class DriveTrainItemListScreen extends StatefulWidget {
  static const routeName = 'driveTrain-item-list-screen';

  @override
  _DriveTrainItemListScreenState createState() =>
      _DriveTrainItemListScreenState();
}

class _DriveTrainItemListScreenState extends State<DriveTrainItemListScreen> {
  var _boolCheck = true;
  var _boolCheck2 = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_boolCheck2 == true) {
      Provider.of<DriveTrainProvider>(context, listen: false)
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
    return Provider.of<DriveTrainProvider>(context, listen: false)
        .fetchItems(context);
  }

  @override
  Widget build(BuildContext context) {
    final itemData = Provider.of<DriveTrainProvider>(
      context,
    );
        final auth = Provider.of<Auth>(context, listen: false).email;

    return Scaffold(
      floatingActionButton:
         auth == null
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
        auth!=null?  Chip(
              elevation: 10,
              shadowColor: Colors.amber,
              backgroundColor: Colors.blue[900],
              label: Consumer<DriveTrainProvider>(
                builder: (context, data, _) => Text(
                    '\₹' + itemData.totalItemCost.toStringAsFixed(2),
                    style:const TextStyle(color: Colors.white)),
              )):Text('')
        ],
      ),
      body: Consumer<DriveTrainProvider>(
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
                              const  Icon(
                                  Icons.hot_tub,
                                  size: 100,
                                ),
                               auth!=null? Text(
                                    "Empty here, click on '+' button to add items"):Text(
                                    "Empty here.")
                              ],
                            ),
                          )
                        : ListView.builder(
                          // physics: AlwaysScrollableScrollPhysics(),
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
