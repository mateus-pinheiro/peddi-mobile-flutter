import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/models/restaurant.dart';

class API {
  static const String _apiUrl = 'http://192.168.15.27:3001/api';
  final http.Client _client = http.Client();

//  Future<Restaurant> getRestaurant() async {
//    var response = await _client.get('$_apiUrl');
//    if (response.statusCode == 200) {
//      print(Restaurant.fromMap(json.decode(response.body)));
//    }
//    print(response.body);
//    return null;
//  }

  Future<Restaurant> getRestaurant() async {
    var response =
        await _client.get('$_apiUrl/restaurants/5b6a07122bd2a8162ad22e59');
    if (response.statusCode == 200) {
      final Restaurant res = Restaurant.fromMap(json.decode(response.body));
      return res;
    }
    return null;
  }

//  Future<Response> postOrder(url,
//      {Map<String, String> headers, body, Encoding encoding}) {
//    var response = ((client) => client.post('$_apiUrl/orders/',
//        headers: headers, body: body, encoding: encoding));
//
//    return response;
//  }

  Future<Response> postOrder(Order order) async {
    var jsonEncoded = json.encode(order.toJson());
    var request = await _client.post(jsonEncoded);
    return request;
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

//  Future<Restaurant> getRestaurant() async {
//    var response = await _client.get('$_apiUrl/restaurant');
//    if (response.statusCode == 200) {
//      return Restaurant.fromMap(json.decode(response.body));
//    }
//
//    return null;
//  }

}
