import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vegieapp/Models/product.dart';
import 'package:vegieapp/controllers/orderscontroller.dart';
import 'package:vegieapp/pages/orderpage.dart';

import 'additem.dart';

class Cartpage extends StatefulWidget {
  Cartpage({Key? key, required this.productid}) : super(key: key);
  int productid;
  @override
  _CartpageState createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  ProductDetail? product;
  fetchProductDetail() async {
    try {
      product = await OrderController().getProductDetails(widget.productid);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    fetchProductDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Order Details',
          style: TextStyle(color: Colors.green),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Orderpage()));
          },
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.green,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.qr_code_scanner,
                color: Colors.green,
              ))
        ],
      ),
      body: product == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Order no #${product!.productId}',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(Icons.person),
                          title: Text(
                            '${product!.categoryName}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              OutlinedButton(
                                  onPressed: () {
                                    launch('tel:${product}');
                                  },
                                  child: Text(
                                    'Call',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.green),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(left: 4, right: 4)),
                              OutlinedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Navigate',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.green),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          onTap: () {},
                          leading: Image.asset(
                            "assets/Photo.jpeg",
                          ),
                          title: const Text(
                            'Garlic',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text('Rs. 190/kg'),
                          trailing: Text(
                            '2 KG',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Additem()));
                          },
                          child: const Text(
                            'Add Items',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Orderpage()));
                            },
                            child: Text(
                              'Confirm delivery',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
