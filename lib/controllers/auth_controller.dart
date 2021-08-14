import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegieapp/webservice/webservice_manager.dart';
import 'package:vegieapp/webservice/webservice_response.dart';

class AuthController {
  WebService wsm = WebService();

  Future<String> loginCab(String phone, String password) async {
    WebserviceResponse wsmResponse;
    SharedPreferences _pref = await SharedPreferences.getInstance();
    try {
      wsmResponse = await wsm
          .makePostRequest('cab/auth', {"phone": phone, "password": password});
      print(wsmResponse);
      if (wsmResponse.responseBody['status'] == 'success') {
        //save auth token
        _pref.setString('token', wsmResponse.responseBody['token']);
      }

      return wsmResponse.responseBody['status'];
    } catch (e) {
      return 'error';
    }
  }
}
