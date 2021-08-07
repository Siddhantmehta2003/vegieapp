import 'package:flutter/material.dart';
import 'package:vegieapp/orderpage.dart';
import 'package:vegieapp/registrationpage.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  _ProfilepageState createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Orderpage()));
          },
          icon: const Icon(Icons.home),
          color: Colors.green,
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'My Account',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: Image.asset('assets/Photo.jpeg'),
                      title: const Text('Siddhant Mehta'),
                      subtitle: const Text('siddhantmehta02@gmail.com'),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('My information'),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios)),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Change Password'),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios)),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => registerpage()));
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
