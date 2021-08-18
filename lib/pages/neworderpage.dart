import 'package:flutter/material.dart';
import 'package:vegieapp/Models/order.dart';
import 'package:vegieapp/controllers/orderscontroller.dart';
import 'package:vegieapp/webservice/webservice_manager.dart';
import 'package:vegieapp/webservice/webservice_response.dart';

class NewOrderPage extends StatefulWidget {
  const NewOrderPage({Key? key}) : super(key: key);

  @override
  _NewOrderPageState createState() => _NewOrderPageState();
}

class _NewOrderPageState extends State<NewOrderPage> {
  List<Order>? orders;

  fetchOrders() async {
    try {
      orders = await OrderController().getNewOrder();
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
                  child: Text("No new orders"),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: orders!.length,
                    itemBuilder: (context, index) => Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Order no #${orders![index].cabOrderId}',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.person),
                            title: Text(
                              '${orders![index].userName}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('${orders![index].userAddress}'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Deliver it by ${DateTime.parse(orders![index].createdAt!).day}-${DateTime.parse(orders![index].createdAt!).month}-${DateTime.parse(orders![index].createdAt!).year}',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () async {
                                      WebService wsm = WebService();
                                      try {
                                        WebserviceResponse response =
                                            await wsm.makePostRequestToken(
                                          'cab/neworders',
                                          {
                                            "cab_order_id":
                                                orders![index].cabOrderId,
                                            'cab_order_status': "4"
                                          },
                                        );
                                        final status =
                                            response.responseBody['status'];
                                        if (status == 'success') {
                                          await showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(
                                                    'You have rejected the order!'),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        'OK!',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                                    Colors
                                                                        .green),
                                                      ))
                                                ],
                                              );
                                            },
                                          );
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(
                                                    'Failed to reject order. please try again'),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        'OK!',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                                    Colors
                                                                        .green),
                                                      ))
                                                ],
                                              );
                                            },
                                          );
                                        }
                                        fetchOrders();
                                      } catch (e) {
                                        await showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Failed to reject order. please try again'),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      'OK!',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(
                                                                  Colors.green),
                                                    ))
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    },
                                    child: const Text(
                                      'Reject',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              side: const BorderSide(
                                                  color: Colors.green,
                                                  width: 1))),
                                    ),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(right: 4)),
                                Padding(padding: EdgeInsets.only(left: 4)),
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () async {
                                      WebService wsm = WebService();
                                      try {
                                        WebserviceResponse response =
                                            await wsm.makePostRequestToken(
                                          'cab/neworders',
                                          {
                                            "cab_order_id":
                                                orders![index].cabOrderId,
                                            'cab_order_status': "1"
                                          },
                                        );
                                        final status =
                                            response.responseBody['status'];
                                        if (status == 'success') {
                                          await showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(
                                                    'You have accepted the order!!'),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        'OK!',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                                    Colors
                                                                        .green),
                                                      ))
                                                ],
                                              );
                                            },
                                          );
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(
                                                    'Failed to accept order. please try again'),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        'OK!',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                                    Colors
                                                                        .green),
                                                      ))
                                                ],
                                              );
                                            },
                                          );
                                        }
                                        fetchOrders();
                                      } catch (e) {
                                        await showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Failed to accept order. please try again'),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      'OK!',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(
                                                                  Colors.green),
                                                    ))
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    },
                                    child: const Text('Accept',
                                        style: TextStyle(color: Colors.white)),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.green),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0))),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}
