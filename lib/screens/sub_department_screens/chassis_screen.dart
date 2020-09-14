import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/departments_provider/chassis.dart';
import '../../widgets/item_card.dart';
import '../add_item_screen.dart';

class ChassisItemListScreen extends StatelessWidget {
  static const routeName = 'chassis-item-list-screen';
  

  @override
  Widget build(BuildContext context) {
    final itemData = Provider.of<ChassisProvider>(context);
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
              label: Consumer<ChassisProvider>(builder: (context,data,_)=>Text('\$'+itemData.totalItemCost.toStringAsFixed(2), style: TextStyle(color: Colors.white)),))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ItemCard(itemData.items[index],itemData.deleteItem,itemData.undoDelete,index),
        itemCount: itemData.items.length,
      ),
    );
  }
}
