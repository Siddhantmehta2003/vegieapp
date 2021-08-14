import 'package:flutter/material.dart';
import 'package:vegieapp/controllers/auth_controller.dart';
import 'package:vegieapp/pages/orderpage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
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
                      "UserName",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: _username,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        hintText: "UserName",
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
                      controller: _password,
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
                      onPressed: () async {
                        final username = _username.text;
                        final password = _password.text;

                        String result =
                            await AuthController().loginCab(username, password);
                        if (result == 'success') {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Orderpage(),
                              ));
                        } else if (result == 'invalid login credential') {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Text('popat'),
                            ),
                          );
                        }
                        //TODO: add login logic
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
