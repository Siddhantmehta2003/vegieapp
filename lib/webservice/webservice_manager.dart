import 'dart:convert';

import 'package:http/http.dart';
import 'package:vegieapp/webservice/webservice_response.dart';

import '../Constants.dart';

class WebService {
  static final String baseURL = Constants.baseurl;
  // Method that handles post request without access token
  Future<WebserviceResponse> makePostRequest(
      String endpoint, var jsonMap) async {
    WebserviceResponse wsResponse;
    // set up POST request arguments
    String mainUrl = baseURL + '/' + endpoint;

    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    // make POST request
    print("json body" + jsonEncode(jsonMap));
    Response response = await post(Uri.parse(mainUrl),
        headers: headers, body: jsonEncode(jsonMap));
    print('response ${response.body}');

    // check the status code for the result
    // int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body = response.body.toString();
    Map<dynamic, dynamic> bodyMap = jsonDecode(body);

    wsResponse = new WebserviceResponse(
      response.statusCode,
      response.headers,
      bodyMap,
      bodyMap["error"] != null || bodyMap['status'] == 400,
      bodyMap["error"] != null ? bodyMap["error"] : null,
    );
    return wsResponse;
  }

//Handles get request
  Future<WebserviceResponse> makeGetRequest(String endpoint) async {
    WebserviceResponse wsResponse;
    // make GET request
    String mainUrl = baseURL + '/' + endpoint;
    // Response response = await get(mainUrl);
    Response response = await get(
      Uri.parse(mainUrl),
      // Send authorization headers to the backend.
      headers: {},
    );
    String json = response.body.toString();
    Map<dynamic, dynamic> jsonMap = jsonDecode(json);
    wsResponse = new WebserviceResponse(
        response.statusCode,
        response.headers,
        jsonMap["data"],
        jsonMap["error"] != null,
        jsonMap["error"] != null ? jsonMap["error"] : null);
    return wsResponse;
  }
}
