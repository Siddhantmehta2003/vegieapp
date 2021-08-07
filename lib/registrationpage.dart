import 'package:flutter/material.dart';
import 'package:vegieapp/loginpage.dart';

import 'orderpage.dart';

class registerpage extends StatefulWidget {
  const registerpage({Key? key}) : super(key: key);

  @override
  _registerpageState createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /* leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Loginpage()));
          },
          icon: Icon(Icons.login),
          color: Colors.green,
        ),*/
        title: Text(
          'Register',
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.all(30),
          child: Card(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Name",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        hintText: "Name",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Mobile Number",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        hintText: "Mobile Number",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Username",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        hintText: "Username",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Password",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        hintText: "Password",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {
                        //TODO: add login logic
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Orderpage(),
                            ));
                      },
                      child: Text(
                        "REGISTER",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Already our friend?  ",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Loginpage(),
                              ));
                        },
                        child: Text(
                          "Login Here :)",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
