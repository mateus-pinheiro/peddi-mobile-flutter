import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/models/rating.dart';
import 'package:peddi_tont_app/models/restaurant.dart';

class API {
//  IP LM09
//  static const String _apiUrl = 'http://192.168.1.71:3001/api';

//  IP LUCCAS
//  static const String _apiUrl = 'http://192.168.15.13:3000/api';

//  IP PEDDI
//  static const String _apiUrl = 'http://192.168.15.11:3000/api';

//  IP CASA
  static const String _apiUrl = 'http://192.168.15.15:3000/api';
  final http.Client _client = http.Client();

  Future<Restaurant> getRestaurant() async {
    var response =
        await _client.get('$_apiUrl/restaurants/5ba9490dc3ccc9a9c664b346');
    if (response.statusCode == 200) {
      final Restaurant res = Restaurant.fromMap(json.decode(response.body));
      return res;
    }
    return null;
  }

  Future<Response> postOrder(Order order) async {
    var jsonEncoded = json.encode(order.toJson());
    try {
      var request = await _client.post('$_apiUrl/orders',
          headers: {"Content-Type": "application/json"}, body: jsonEncoded);

      return request;
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  Future<Response> postRating(Rating rating) async {
    var jsonRating = json.encode(rating.toJson());

    try {
      var request = await _client.post('$_apiUrl/rating',
          headers: {"Content-Type": "application/json"}, body: jsonRating);

      return request;
    } on Exception catch (e) {
      return Future.error(e);
    }
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
