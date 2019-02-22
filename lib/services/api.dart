import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:peddi_tont_app/models/body/ask_order_body.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/models/response/response_open_order.dart';
import 'package:peddi_tont_app/models/restaurant.dart';

class API {

//RASPI
//  static const String _apiUrl = 'http://192.168.0.70:8000/api';

//  IP CASA
  static const String _apiUrl = 'http://192.168.15.13:8000/api';

  final http.Client _client = http.Client();

  Future<Restaurant> getRestaurant() async {
    var response = await _client.get('$_apiUrl/restaurants/');
    if (response.statusCode == 200) {
      final Restaurant res = Restaurant.fromMap(json.decode(response.body));
      return res;
    }
    return null;
  }

  Future<ResponseOpenOrder> openOrder(Order order) async {
    var jsonEncoded = json.encode(order.toJson());
    try {
      var request = await _client.post('$_apiUrl/orders/',
          headers: {"Content-Type": "application/json"}, body: jsonEncoded);

      ResponseOpenOrder responseOpenOrder = ResponseOpenOrder.fromMap(json.decode(request.body));

      return responseOpenOrder;
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  Future<Response> askOrder(AskOrderBody order) async {
    var jsonEncoded = json.encode(order.toJson());
    var response = await _client.put('$_apiUrl/orders/' + order.id,
          headers: {"Content-Type": "application/json"},
          body: jsonEncoded);

    if (response.statusCode == 200) {
      return response;
    }

    return null;
  }

  Future<Response> endOrder(String orderId) async {
    var response = await _client.delete('$_apiUrl/orders/' + orderId,
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      return response;
    }

    return null;
  }

//  Future<Restaurant> getRestaurantNotAsync() {
//    var response = _client.get('$_apiUrl/restaurants/5b6a07122bd2a8162ad22e59');
//    response.then(Restaurant.fromMap(json.decode(response.body)), onError: 'erro');
//
//    //    if (response.statusCode == 200) {
////      return (Restaurant.fromMap(json.decode(response.body)));
//////      final Restaurant res = JSON.decode(response.body);
////
////    }
//    return null;
//  }

//  Future<String> getData() async {
//    http.Response response = await http.get(
//        Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
//        headers: {"Accept": "application/json"});
//
//    print(response.body);
//    return response.body;
//  }

}
