import 'package:intl/intl.dart';
import '../main_imports.dart';

class ItemCard extends StatelessWidget {
  final ItemModel modelData;
  final Function dismissFunction;
  final Function undoFunction;
  final int index;

  ItemCard(this.modelData, this.dismissFunction, this.undoFunction, this.index);

  @override
  Widget build(BuildContext context) {
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

    return Dismissible(
      
      key: ValueKey(modelData.itemId),
      onDismissed: (direction) async {
        await dismissFunction(modelData.itemId,context);
        // print(modelData.itemId);
        Scaffold.of(context).showSnackBar(SnackBar(
            action: SnackBarAction(
                label: 'Undo',
                onPressed: () {
                  undoFunction(context,index, modelData);
                }),
            elevation: 5,
            backgroundColor: Colors.blue[50],
            content: Text('Item Removed!',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold))));
      },
      direction: DismissDirection.endToStart,
      background: Container(
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Icon(Icons.delete, size: 30),
          ),
          alignment: Alignment.centerRight),
      child: Padding(
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
                          child: Text(modelData.itemName,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: TextStyle(fontSize: 20)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Text(
                              DateFormat('dd MMM').format(modelData.itemDate),
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
                                '\₹${(modelData.itemCost * modelData.itemQuantity).toStringAsFixed(2)}',
                                style: TextStyle(fontSize: 20))),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Text(
                            '  x' + modelData.itemQuantity.toString(),
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    trailing: Icon(Icons.arrow_drop_down_circle),
                    children: [
                      divider,
                      _listTile('Buyer: ', modelData.itemBuyer),
                      divider,
                      _listTile('Vendor: ', modelData.itemVendor),
                      divider,
                      _listTile('Descripton: ', modelData.itemDescription)
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
