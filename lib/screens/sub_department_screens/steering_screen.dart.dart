import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/departments_provider/steering.dart';
import '../../widgets/item_card.dart';

class SteeringItemListScreen extends StatelessWidget {
  static const routeName = 'steering-item-list-screen';
  

  @override
  Widget build(BuildContext context) {
    final itemData = Provider.of<SteeringProvider>(context, );
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
              label: Consumer<SteeringProvider>(builder: (context,data,_)=>Text('\$'+itemData.totalItemCost.toStringAsFixed(2), style: TextStyle(color: Colors.white)),))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ItemCard(itemData.items[index],itemData.deleteItem,itemData.undoDelete,index),
        itemCount: itemData.items.length,
      ),
    );
  }
}
