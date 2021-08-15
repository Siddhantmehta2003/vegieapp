import 'package:flutter/material.dart';
import 'package:vegieapp/Models/order.dart';
import 'package:vegieapp/controllers/orderscontroller.dart';

class Completedpage extends StatefulWidget {
  const Completedpage({Key? key}) : super(key: key);

  @override
  _CompletedpageState createState() => _CompletedpageState();
}

class _CompletedpageState extends State<Completedpage> {
  List<Order>? orders;

  fetchOrders() async {
    try {
      orders = await OrderController().getCompleted();
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    fetchOrders();
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
                  child: Text("No orders to display"),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: orders!.length,
                    itemBuilder: (context, index) => CompletedOrder(
                      order: orders![index],
                    ),
                  ),
                ),
    );
  }
}

class CompletedOrder extends StatelessWidget {
  CompletedOrder({Key? key, required this.order}) : super(key: key);

  final Order order;

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
                  'Order no #${order.cabOrderId}',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              '${order.userName}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('${order.userAddress}'),
            trailing: OutlinedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
                onPressed: () {},
                child: const Text(
                  'Completed!',
                  style: TextStyle(color: Colors.white),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Deliver it by ${DateTime.parse(order.createdAt!).day}-${DateTime.parse(order.createdAt!).month}-${DateTime.parse(order.createdAt!).year}',
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
