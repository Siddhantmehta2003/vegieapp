import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:vegieapp/pages/completedpage.dart';
import 'package:vegieapp/pages/inprogresspage.dart';
import 'package:vegieapp/pages/neworderpage.dart';
import 'package:vegieapp/pages/profilepage.dart';

class Orderpage extends StatefulWidget {
  const Orderpage({Key? key}) : super(key: key);

  @override
  _OrderpageState createState() => _OrderpageState();
}

class _OrderpageState extends State<Orderpage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      initialIndex: 1,
      vsync: this,
    );
  }

  TabController? _tabController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Profilepage()));
            },
            icon: const Icon(Icons.person),
            color: Colors.green,
          )
        ],
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(
        //     Icons.menu,
        //     color: Colors.green,
        //   ),
        // ),
        centerTitle: true,
        title: const Text(
          'Orders',
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.white,
        bottom: TabBar(
          labelColor: Colors.black,
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: 'New',
            ),
            Tab(
              text: 'In Progress',
            ),
            Tab(
              text: 'Completed',
            ),
          ],
        ),
      ),
      // drawer: const Drawer(),
      body: TabBarView(
        controller: _tabController,
        children: [
          NewOrderPage(),
          Inprogress(),
          Completedpage(),
        ],
      ),
    );
  }
}
