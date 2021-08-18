import 'package:flutter/material.dart';
import 'package:vegieapp/Models/product.dart';
import 'package:vegieapp/Models/product_modal.dart';
import 'package:vegieapp/controllers/orderscontroller.dart';
import 'package:vegieapp/pages/cartpage.dart';

import 'package:vegieapp/pages/orderpage.dart';

// ignore: must_be_immutable
class Additem extends StatefulWidget {
  Additem({Key? key}) : super(key: key);

  @override
  _AdditemState createState() => _AdditemState();
  String dropdownValue = 'One';
}

class _AdditemState extends State<Additem> {
  List<Product>? products;

  int quantity = 1;
  TextEditingController priceController = TextEditingController();
  fetchProducts() async {
    products = await OrderController().getAllProducts();
    productNames = products!.map((e) => e.productName!).toList();
    selectedProduct = products![0];
    fetchProductDetail();
    setState(() {});
  }

  Price? selectedPrice;

  List<String>? productNames;
  Product? selectedProduct;

  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  int price = 0;
  ProductDetail? product;
  fetchProductDetail() async {
    if (selectedProduct == null) {
      return;
    }
    try {
      product =
          await OrderController().getProductDetails(selectedProduct!.productId);
      if (product!.price == null || product!.price!.length == 0) {
        return;
      }
      selectedPrice = product!.price![0];

      print(product!.price![0].productPrice);
      price = selectedPrice!.productPrice! * quantity;
      priceController.text = price.toString();
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Add New Item',
            style: TextStyle(color: Colors.green),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Orderpage()));
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.green,
          ),
          actions: [
            IconButton(
              onPressed: () {
                // TODO :Add qr code scanner
              },
              icon: const Icon(Icons.qr_code_scanner),
              color: Colors.green,
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(
                        'Name of Product',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          productNames == null
                              ? Container()
                              : DropdownButton<Product>(
                                  value: selectedProduct,
                                  items: products!.map((Product value) {
                                    return DropdownMenuItem<Product>(
                                      value: value,
                                      child: new Text(value.productName!),
                                    );
                                  }).toList(),
                                  onChanged: (_) {
                                    selectedProduct = _;
                                    fetchProductDetail();
                                    setState(() {});
                                  },
                                ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            // product id save => photo display as per product id.
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(
                        'Quantity',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          DropdownButton<int>(
                            value: quantity,
                            items: <int>[1, 2, 3, 4, 5, 6].map((int value) {
                              return DropdownMenuItem<int>(
                                value: value,
                                child: new Text(value.toString()),
                              );
                            }).toList(),
                            onChanged: (_) {
                              quantity = _!;
                              fetchProductDetail();
                              setState(() {});
                            },
                          ),
                          if (product != null && selectedPrice != null)
                            DropdownButton<Price>(
                              value: selectedPrice,
                              items: product!.price!.map((Price value) {
                                return DropdownMenuItem<Price>(
                                  value: value,
                                  child:
                                      new Text(value.priceUnitName.toString()),
                                );
                              }).toList(),
                              onChanged: (_) {
                                selectedPrice = _!;
                                price = selectedPrice!.productPrice! * quantity;
                                priceController.text = price.toString();
                                // setState(() {});
                                // fetchProductDetail();
                                setState(() {});
                              },
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(
                        'Price',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      child: TextField(
                        controller: priceController,
                        readOnly: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Price'),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => Cartpage()));
                      // navigate to Cartpage().
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green)),
                  )),
                ],
              ),
            )
          ],
        ));
  }
}
