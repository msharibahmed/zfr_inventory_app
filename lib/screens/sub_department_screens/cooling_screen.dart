import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/departments_provider/cooling.dart';
import '../../widgets/item_card.dart';

class CoolingItemListScreen extends StatelessWidget {
  static const routeName = 'cooling-item-list-screen';
  

  @override
  Widget build(BuildContext context) {
    final itemData = Provider.of<CoolingProvider>(context, listen: false);
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
              label: Text('\$'+itemData.totalItemCost.toStringAsFixed(2), style: TextStyle(color: Colors.white)))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ItemCard(itemData.items[index]),
        itemCount: itemData.items.length,
      ),
    );
  }
}
