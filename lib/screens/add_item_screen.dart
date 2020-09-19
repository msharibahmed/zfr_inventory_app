import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/item_model.dart';

// import '../provider/product.dart';

class AddItemScreen extends StatefulWidget {
  static const routeName = 'add-item-screen';
  final Function prov;
  AddItemScreen(this.prov);
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _priceFocus = FocusNode();
  final _buyerFocus = FocusNode();
  final _vendorFocus = FocusNode();
  final _descriptionFocus = FocusNode();
  final _quantityFocus = FocusNode();

  // final _imageUrlController = TextEditingController();
  // final _imageUrlFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  var _editProduct = ItemModel(
      itemId: null,
      itemName: '',
      itemBuyer: '',
      itemDate: null,
      itemQuantity: 0,
      itemVendor: '',
      itemDescription: '',
      itemCost: 0);
  bool dateCheck = false;

  var _boolCheck = false;
  @override
  void dispose() {
    super.dispose();
    // _imageUrlFocus.removeListener(_updateImageUrl);
    // _imageUrlController.dispose();

    _priceFocus.dispose();
    _buyerFocus.dispose();
    _vendorFocus.dispose();
    _quantityFocus.dispose();
    _descriptionFocus.dispose();
  }

  @override
  void initState() {
    super.initState();
    // _imageUrlFocus.addListener(_updateImageUrl);
  }

  // var _isInit = true;
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   if (_isInit) {
  //     final id = ModalRoute.of(context).settings.arguments as String;
  //     if (id != null) {
  //       _editProduct = Provider.of<Products>(context).findById(id);
  //       _imageUrlController.text = _editProduct.imageUrl;
  //     }
  //   }
  //   _isInit = false;
  // }

  // void _updateImageUrl() {
  //   if (!_imageUrlFocus.hasFocus) {
  //     if (_imageUrlController.text.isEmpty ||
  //         !_imageUrlController.text.startsWith('http') &&
  //             !_imageUrlController.text.startsWith('https') ||
  //         !_imageUrlController.text.endsWith('.jpg') &&
  //             !_imageUrlController.text.endsWith('.png') &&
  //             !_imageUrlController.text.endsWith('.jpeg')) {
  //       return;
  //     }

  //     setState(() {
  //       //used Just to build the whole ui
  //     });
  //   }
  // }

  Future<void> _saveForm() async {
    final bool valBool = _formKey.currentState.validate();
    if (!valBool) {
      return;
    }

    _formKey.currentState.save();
    setState(() {
      _boolCheck = true;
    });
    if (_editProduct.itemId == null) {
      // Provider.of<Products>(context).addProduct(_editProduct);
      await widget.prov(_editProduct, context);
    }
    //else {
    //   Provider.of<Products>(context, listen: false).updateProduct(_editProduct);
    // }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add new ')),
      body: _boolCheck
          ? Center(child: CircularProgressIndicator())
          : Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      TextFormField(
                        // initialValue: _editProduct.itemName,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'This field cannot be empty.';
                          }
                          return null;
                        },
                        onSaved: (newValue) => _editProduct = ItemModel(
                            itemId: _editProduct.itemId,
                            itemName: newValue,
                            itemBuyer: _editProduct.itemBuyer,
                            itemDate: _editProduct.itemDate,
                            itemDescription: _editProduct.itemDescription,
                            itemQuantity: _editProduct.itemQuantity,
                            itemVendor: _editProduct.itemVendor,
                            itemCost: _editProduct.itemCost),
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_buyerFocus);
                        },
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          labelText: 'Item Name',
                        ),
                      ),

                      TextFormField(
                        // initialValue: _editProduct.itemName,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'This field cannot be empty.';
                          }
                          return null;
                        },
                        onSaved: (newValue) => _editProduct = ItemModel(
                            itemId: _editProduct.itemId,
                            itemName: _editProduct.itemName,
                            itemBuyer: newValue,
                            itemDate: _editProduct.itemDate,
                            itemDescription: _editProduct.itemDescription,
                            itemQuantity: _editProduct.itemQuantity,
                            itemVendor: _editProduct.itemVendor,
                            itemCost: _editProduct.itemCost),
                        focusNode: _buyerFocus,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_vendorFocus);
                        },
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          labelText: 'Who was the Buyer?',
                        ),
                      ),
                      TextFormField(
                        // initialValue: _editProduct.itemName,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'This field cannot be empty.';
                          }
                          return null;
                        },
                        onSaved: (newValue) => _editProduct = ItemModel(
                            itemId: _editProduct.itemId,
                            itemName: _editProduct.itemName,
                            itemBuyer: _editProduct.itemBuyer,
                            itemDate: _editProduct.itemDate,
                            itemDescription: _editProduct.itemDescription,
                            itemQuantity: _editProduct.itemQuantity,
                            itemVendor: newValue,
                            itemCost: _editProduct.itemCost),
                        focusNode: _vendorFocus,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_priceFocus);
                        },
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          labelText: 'Who was the Vendor?',
                        ),
                      ),
                      TextFormField(
                        // initialValue: _editProduct.price.toString(),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'This field cannot be empty.';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Enter Valid numbers.';
                          }
                          if ((double.parse(value)) <= 0) {
                            return 'Price cannot be zero.';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        onSaved: (newValue) => _editProduct = ItemModel(
                            itemId: _editProduct.itemId,
                            itemName: _editProduct.itemName,
                            itemBuyer: _editProduct.itemBuyer,
                            itemDate: _editProduct.itemDate,
                            itemDescription: _editProduct.itemDescription,
                            itemQuantity: _editProduct.itemQuantity,
                            itemVendor: _editProduct.itemVendor,
                            itemCost: double.parse(newValue)),
                        focusNode: _priceFocus,
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(_quantityFocus),
                        decoration: InputDecoration(
                          labelText: 'Item Price',
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: TextFormField(
                              // initialValue: _editProduct.price.toString(),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'This field cannot be empty.';
                                }
                                if (int.tryParse(value) == null) {
                                  return 'Enter Valid numbers.';
                                }
                                if ((int.parse(value)) <= 0) {
                                  return 'Quantity cannot be zero.';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              onSaved: (newValue) => _editProduct = ItemModel(
                                  itemId: _editProduct.itemId,
                                  itemName: _editProduct.itemName,
                                  itemBuyer: _editProduct.itemBuyer,
                                  itemDate: _editProduct.itemDate,
                                  itemDescription: _editProduct.itemDescription,
                                  itemQuantity: int.parse(newValue),
                                  itemVendor: _editProduct.itemVendor,
                                  itemCost: _editProduct.itemCost),
                              focusNode: _quantityFocus,
                              onFieldSubmitted: (_) => FocusScope.of(context)
                                  .requestFocus(_descriptionFocus),
                              decoration: InputDecoration(
                                labelText: 'Item Quantity',
                              ),
                            ),
                          ),
                          Card(
                              color: dateCheck ? Colors.red : Colors.white,
                              elevation: 5,
                              shadowColor: Colors.amber,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                    _editProduct.itemDate == null
                                        ? 'Pick Date'
                                        : DateFormat('dd MMM, yyyy')
                                            .format(_editProduct.itemDate),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              )),
                          Card(
                            elevation: 5,
                            shadowColor: Colors.purple,
                            color: Colors.yellow[100],
                            child: IconButton(
                                icon: Icon(
                                  Icons.event,
                                  size: 40,
                                  color: Colors.purple,
                                ),
                                onPressed: () {
                                  showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2020),
                                          lastDate: DateTime(2021))
                                      .then((value) {
                                    setState(() {
                                      _editProduct = ItemModel(
                                          itemId: _editProduct.itemId,
                                          itemName: _editProduct.itemName,
                                          itemBuyer: _editProduct.itemBuyer,
                                          itemDate: value,
                                          itemDescription:
                                              _editProduct.itemDescription,
                                          itemQuantity:
                                              _editProduct.itemQuantity,
                                          itemVendor: _editProduct.itemVendor,
                                          itemCost: _editProduct.itemCost);
                                    });
                                  });
                                }),
                          )
                        ],
                      ),
                      TextFormField(
                        // initialValue: _editProduct.description,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'This field cannot be empty.';
                          }
                          if (value.length < 10) {
                            return 'Description is too short.';
                          }
                          return null;
                        },
                        onSaved: (newValue) => _editProduct = ItemModel(
                            itemId: _editProduct.itemId,
                            itemName: _editProduct.itemName,
                            itemBuyer: _editProduct.itemBuyer,
                            itemDate: _editProduct.itemDate,
                            itemDescription: newValue,
                            itemQuantity: _editProduct.itemQuantity,
                            itemVendor: _editProduct.itemVendor,
                            itemCost: _editProduct.itemCost),
                        focusNode: _descriptionFocus,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          labelText: 'Item Description',
                        ),
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                      ),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.end,
                      //   children: [
                      //     Container(
                      //       height: 100,
                      //       width: 100,
                      //       decoration: BoxDecoration(border: Border.all(width: 1)),
                      //       child: _imageUrlController.text.isEmpty
                      //           ? const Center(child: Text('Image Preview'))
                      //           : FittedBox(
                      //               fit: BoxFit.contain,
                      //               child: Image.network(_imageUrlController.text)),
                      //     ),
                      //     Expanded(
                      //       child: TextFormField(
                      //         validator: (value) {
                      //           if (value.isEmpty) {
                      //             return 'This field cannot be empty.';
                      //           }
                      //           if (!value.startsWith('http') &&
                      //               !value.startsWith('https')) {
                      //             return 'Enter valid URL.';
                      //           }
                      //           if (!value.endsWith('.jpg') &&
                      //               !value.endsWith('.png') &&
                      //               !value.endsWith('.jpeg')) {
                      //             return 'Enter valid URL..';
                      //           }
                      //           return null;
                      //         },
                      //         onSaved: (newValue) => _editProduct = Product(
                      //             title: _editProduct.title,
                      //             description: _editProduct.description,
                      //             price: _editProduct.price,
                      //             id: _editProduct.id,
                      //             imageUrl: newValue),
                      //         textInputAction: TextInputAction.done,
                      //         controller: _imageUrlController,
                      //         decoration: const InputDecoration(
                      //           labelText: 'Image URL',
                      //         ),
                      //         onFieldSubmitted: (_) => _saveForm(),
                      //         focusNode: _imageUrlFocus,
                      //         keyboardType: TextInputType.url,
                      //       ),
                      //     ),
                      //   ],
                      //   // https://flutter.dev/assets/homepage/carousel/phone_bezel-467ab8d838e5e2d2d3f347f766173ccc365220223692215416e4ce7342f2212f.png
                      // ),
                      RaisedButton(
                          color: Colors.deepOrangeAccent[100],
                          child: Text('Save Item',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onPressed: () {
                            if (_editProduct.itemDate == null) {
                              setState(() {
                                dateCheck = true;
                              });
                              return;
                            } else {
                              _saveForm();
                            }
                          })
                    ],
                  )),
                ),
              ),
            ),
    );
  }
}
