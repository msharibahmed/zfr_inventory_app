
import 'package:flutter/foundation.dart';

class  ItemModel {
  final String itemId;
  final String itemName;
  final DateTime itemDate;
  final double itemCost;
  final int itemQuantity;
  final String itemBuyer;
  final String itemVendor;
  final String itemDescription;

  ItemModel(
      {@required this.itemId,
      @required this.itemName,
      @required this.itemBuyer,
      @required this.itemDate,
      @required this.itemDescription,
      @required this.itemQuantity,
      @required this.itemVendor,
      @required this.itemCost});
}