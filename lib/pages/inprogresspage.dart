import 'package:flutter/material.dart';
import 'package:vegieapp/Models/order.dart';
import 'package:vegieapp/Models/product.dart';
import 'package:vegieapp/controllers/orderscontroller.dart';
import 'package:vegieapp/pages/additem.dart';
import 'package:vegieapp/pages/cartpage.dart';

class Inprogress extends StatefulWidget {
  const Inprogress({Key? key}) : super(key: key);

  @override
  _InprogressState createState() => _InprogressState();
}

class _InprogressState extends State<Inprogress> {
  List<Order>? orders;
  fetchInprogress() async {
    try {
      orders = await OrderController().getInprogress();
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    fetchInprogress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: orders == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : orders!.length == 0
              ? Center(
                  child: Text("No orders in progress"),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListView.builder(
                        itemCount: orders!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            inprogressCard(order: orders![index]),
                      ),
                      // in progress => take id from from order.
                      // prduct name and product id both save.
                    ],
                  ),
                ),
    );
  }
}

class inprogressCard extends StatefulWidget {
  inprogressCard({Key? key, required this.order}) : super(key: key);

  final Order order;

  @override
  _inprogressCardState createState() => _inprogressCardState();
}

class _inprogressCardState extends State<inprogressCard> {
  ProductDetail? product;
  fetchProductDetail() async {
    try {
      product =
          await OrderController().getProductDetails(widget.order.cabOrderId!);
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
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Order no #${widget.order.cabOrderId}',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Cartpage(
                            productid: product!.productId!,
                          )));
            },
            leading: Icon(Icons.person),
            title: Text(
              '${widget.order.userName}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('${widget.order.userAddress}'),
            trailing: OutlinedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
                onPressed: () {},
                child: Text(
                  '₹${product == null || product!.price!.length == 0 ? "--" : product!.price![0].productPrice}',
                  style: TextStyle(color: Colors.white),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Deliver it by ${DateTime.parse(widget.order.createdAt!).day}-${DateTime.parse(widget.order.createdAt!).month}-${DateTime.parse(widget.order.createdAt!).year}',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
