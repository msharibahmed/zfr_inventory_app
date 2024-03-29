import 'package:google_fonts/google_fonts.dart';
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

    final auth = Provider.of<Auth>(context,listen: false).email;
    return auth == null
        ? ItemCardWidget(modelData: modelData, divider: divider)
        : Dismissible(
            key: ValueKey(modelData.itemId),
            onDismissed: (direction) async {
              await dismissFunction(modelData.itemId, context);
              // print(modelData.itemId);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        undoFunction(context, index, modelData);
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
                  child:const Icon(Icons.delete, size: 30),
                ),
                alignment: Alignment.centerRight),
            child: ItemCardWidget(modelData: modelData, divider: divider),
          );
  }
}

class ItemCardWidget extends StatelessWidget {
  const ItemCardWidget({
    Key key,
    @required this.modelData,
    @required this.divider,
  }) : super(key: key);

  final ItemModel modelData;
  final Divider divider;

  @override
  Widget build(BuildContext context) {
        final auth = Provider.of<Auth>(context,listen: false).email;

    ListTile listTile(String message1, String message2) {
      return ListTile(
          title: RichText(
              text: TextSpan(
                  text: message1,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                  children: [
            TextSpan(
                text: message2,
                style: const TextStyle(fontWeight: FontWeight.normal))
          ])));
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
          color: Colors.grey[50],
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
                          style: GoogleFonts.nunitoSans(textStyle:const TextStyle(
                             fontSize: 20,fontWeight: FontWeight.w700))),
                      Expanded(
                        child: Text(modelData.itemName,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w200)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                            DateFormat('dd MMM').format(modelData.itemDate),
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20)),
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
                        auth!=null?'Total Cost: ':'Total Quantity:',
                        style:  GoogleFonts.nunitoSans(textStyle:const TextStyle(
                             fontSize: 20,fontWeight: FontWeight.w700)),
                      ),
                     auth!=null? Chip(
                          backgroundColor: Colors.green,
                          elevation: 10.0,
                          shadowColor: Colors.amber,
                          label: Text(
                              '\₹${(modelData.itemCost * modelData.itemQuantity).toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 20))):Text(''),
                    const  Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          '  x' + modelData.itemQuantity.toString(),
                          style:const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
                divider,
                ExpansionTile(
                  backgroundColor: Colors.grey[200],
                  title: Text('Item Details',
                      style: GoogleFonts.nunitoSans(textStyle:const TextStyle(
                             fontSize: 20,fontWeight: FontWeight.w700))),
                  trailing:const Icon(Icons.arrow_drop_down_circle),
                  children: [
                    divider,
                    listTile('Buyer: ', modelData.itemBuyer),
                    divider,
                    listTile('Vendor: ', modelData.itemVendor),
                    divider,
                    listTile('Descripton: ', modelData.itemDescription)
                  ],
                )
              ],
            ),
          )),
    );
  }
}
