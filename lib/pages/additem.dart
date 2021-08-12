import 'package:flutter/material.dart';

import 'package:vegieapp/pages/orderpage.dart';

// ignore: must_be_immutable
class Additem extends StatefulWidget {
  Additem({Key? key}) : super(key: key);

  @override
  _AdditemState createState() => _AdditemState();
  String dropdownValue = 'One';
}

class _AdditemState extends State<Additem> {
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
                          DropdownButton<String>(
                            items: <String>['A', 'B', 'C', 'D']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {},
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
                        'Quantity',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          DropdownButton<String>(
                            items: <String>['1', '2', '3', '4']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {},
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
                    onPressed: () {},
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
