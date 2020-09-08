import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/departments_provider/electronics.dart';
import '../../widgets/item_card.dart';

class ElectronicsItemListScreen extends StatelessWidget {
  static const routeName = 'electronics-item-list-screen';
  

  @override
  Widget build(BuildContext context) {
    final itemData = Provider.of<ElectronicsProvider>(context,);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Items'),
        actions: [
          Chip(
              elevation: 10,
              shadowColor: Colors.amber,
              backgroundColor: Colors.blue[900],
              label: Consumer<ElectronicsProvider>(builder: (context,data,_)=>Text('\$'+itemData.totalItemCost.toStringAsFixed(2), style: TextStyle(color: Colors.white)),))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ItemCard(itemData.items[index],itemData.deleteItem,itemData.undoDelete,index),
        itemCount: itemData.items.length,
      ),
    );
  }
}
