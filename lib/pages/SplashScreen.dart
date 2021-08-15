import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegieapp/Constants.dart';
import 'package:vegieapp/pages/loginpage.dart';
import 'package:vegieapp/pages/orderpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? ctoken;
  checkLogin() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    ctoken = _pref.getString('token');
    print(ctoken);
    if (ctoken != null) {
      token = ctoken;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Orderpage(),
          ));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Loginpage(),
          ));
    }
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
