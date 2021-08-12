import 'package:flutter/material.dart';
import 'package:vegieapp/pages/inprogresspage.dart';
import 'package:vegieapp/pages/orderpage.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({Key? key}) : super(key: key);

  @override
  _CartpageState createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'New Orders',
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
      body: Padding(
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
                      children: const [
                        Text(
                          'Order no #1190',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cartpage()));
                    },
                    leading: Image.asset(
                      "assets/Photo.jpeg",
                    ),
                    title: const Text(
                      'Siddhant Mehta',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('Delhi NCR'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              'Call',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                            )),
                        Padding(padding: EdgeInsets.only(left: 4, right: 4)),
                        OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              'Navigate',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
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
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cartpage()));
                    },
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
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cartpage()));
                    },
                    leading: Image.asset(
                      "assets/Photo.jpeg",
                    ),
                    title: const Text(
                      'Brocli',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('Rs. 80/kg'),
                    trailing: Text(
                      '1 KG',
                      style: TextStyle(fontSize: 18),
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
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cartpage()));
                    },
                    leading: Image.asset(
                      "assets/Photo.jpeg",
                    ),
                    title: const Text(
                      'Brinjals',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('Rs. 100/kg'),
                    trailing: Text(
                      '3 KG',
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
                                builder: (context) => Orderpage()));
                      },
                      child: Text(
                        'Confirm delivery',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
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
