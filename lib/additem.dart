import 'package:flutter/material.dart';

import 'package:vegieapp/orderpage.dart';

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
            'Add Item',
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: DropdownButton(
              icon: const Icon(Icons.expand_more),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.green),
              underline: Container(
                height: 2,
                color: Colors.green,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  // TODO : Add display state text
                });
              },
              items: <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ));
  }
}
