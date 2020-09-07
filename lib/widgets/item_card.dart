import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../provider/item.dart';

class ItemCard extends StatelessWidget {
  final int index;
  ItemCard(this.index);

  @override
  Widget build(BuildContext context) {
    final itemData = Provider.of<ItemProvider>(context, listen: false);
    const Divider divider = Divider();

    ListTile _listTile(String message1, String message2) {
      return ListTile(
          title: RichText(
              text: TextSpan(
                  text: message1,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  children: [
            TextSpan(
                text: message2,
                style: const TextStyle(fontWeight: FontWeight.normal))
          ])));
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.blue[50],
          elevation: 10,
          shadowColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Text('Item: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Expanded(
                        child: Text(itemData.items[index].itemName,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: TextStyle(fontSize: 20)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                            DateFormat('dd MMM')
                                .format(itemData.items[index].itemDate),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                    ],
                  ),
                ),
                divider,
                Padding(
                  padding: const EdgeInsets.only(left: 11.0, top: 5.0),
                  child: Row(
                    children: [
                      Text(
                        'Total Cost: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Chip(
                          backgroundColor: Colors.green,
                          elevation: 10.0,
                          shadowColor: Colors.amber,
                          label: Text(
                              '\$${(itemData.items[index].itemCost * itemData.items[index].itemQuantity).toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 20))),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          '  x' + itemData.items[index].itemQuantity.toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
                divider,
                ExpansionTile(
                  backgroundColor: Colors.blue[100],
                  title: Text('Item Details',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  trailing: Icon(Icons.arrow_drop_down_circle),
                  children: [
                    divider,
                    _listTile('Buyer: ', itemData.items[index].itemBuyer),
                    divider,
                    _listTile('Vendor: ', itemData.items[index].itemVendor),
                    divider,
                    _listTile(
                        'Descripton: ', itemData.items[index].itemDescription)
                  ],
                )
              ],
            ),
          )),
    );
  }
}
