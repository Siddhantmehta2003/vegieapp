import 'dart:convert';

import 'package:http/http.dart';
import 'package:vegieapp/Constants.dart';
import 'package:vegieapp/Models/order.dart';
import 'package:vegieapp/Models/product.dart';
import 'package:vegieapp/Models/product_modal.dart';
import 'package:vegieapp/webservice/webservice_manager.dart';

class OrderController {
  WebService wsm = WebService();

  getInprogress() async {
    // make GET request
    String mainUrl = Constants.baseurl + '/' + 'cab/inprogressorders';
    Response response = await get(
      Uri.parse(mainUrl),
      // Send authorization headers to the backend.
      headers: {
        "Content-type": "application/json",
        'Authorization': 'Bearer $token'
      },
    );
    String json = response.body.toString();
    List jsonList = jsonDecode(json);

    List<Order> orders = jsonList.map((e) => Order.fromJson(e)).toList();
    return orders;
  }

  getNewOrder() async {
    String mainUrl = Constants.baseurl + '/' + 'cab/neworders';
    Response response = await get(
      Uri.parse(mainUrl),
      // Send authorization headers to the backend.
      headers: {
        "Content-type": "application/json",
        'Authorization': 'Bearer $token'
      },
    );
    String json = response.body.toString();
    List jsonList = jsonDecode(json);

    List<Order> orders = jsonList.map((e) => Order.fromJson(e)).toList();
    return orders;
  }

  getCompleted() async {
    // make GET request
    String mainUrl = Constants.baseurl + '/' + 'cab/completedorders';
    Response response = await get(
      Uri.parse(mainUrl),
      // Send authorization headers to the backend.
      headers: {
        "Content-type": "application/json",
        'Authorization': 'Bearer $token'
      },
    );
    String json = response.body.toString();
    List jsonList = jsonDecode(json);

    List<Order> orders = jsonList.map((e) => Order.fromJson(e)).toList();
    return orders;
  }

  getProductDetails(int? id) async {
    String mainUrl;
    // make GET request

    mainUrl = Constants.baseurl + '/' + 'product/$id';
    Response response = await get(
      Uri.parse(mainUrl),
      // Send authorization headers to the backend.
      headers: {
        "Content-type": "application/json",
        'Authorization': 'Bearer $token'
      },
    );
    String json = response.body.toString();
    List jsonList = jsonDecode(json);
    List<ProductDetail> products =
        jsonList.map((e) => ProductDetail.fromJson(e)).toList();
    return products[0];
  }

  getAllProducts() async {
    String mainUrl;
    // make GET request

    mainUrl = Constants.baseurl + '/' + 'product';
    Response response = await get(
      Uri.parse(mainUrl),
      // Send authorization headers to the backend.
      headers: {
        "Content-type": "application/json",
        'Authorization': 'Bearer $token'
      },
    );
    String json = response.body.toString();
    Map<String, dynamic> jsons = jsonDecode(json);
    List jsonList = jsons['product'];
    List<Product> products = jsonList.map((e) => Product.fromJson(e)).toList();
    return products;
  }
}
