import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:peddi_tont_app/models/body/ask_order_body.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/models/product.dart';
import 'package:peddi_tont_app/models/response/response_error_send_product.dart';
import 'package:peddi_tont_app/models/response/response_featured_list.dart';
import 'package:peddi_tont_app/models/response/response_open_order.dart';
import 'package:peddi_tont_app/models/restaurant.dart';

class API {
// RASPI
  static const String _apiUrl = 'http://192.168.15.15:8000/api';

// CASA
//  static const String _apiUrl = 'http://192.168.15.15:8000/api';

// IP FITFOOD
//  static const String _apiUrl = 'http://192.168.0.123:8000/api';

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

      if (request.statusCode == 400) {
        throw Exception(request);
      }

      ResponseOpenOrder responseOpenOrder =
          ResponseOpenOrder.fromMap(json.decode(request.body));

      return responseOpenOrder;
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  Future<Response> askOrder(AskOrderBody order) async {
    var jsonEncoded = json.encode(order.toJson());
//    List<ResponseErrorSendProduct> response1;
    try {
      var response = await _client.put('$_apiUrl/orders/' + order.id,
          headers: {"Content-Type": "application/json"}, body: jsonEncoded);

      if (response.statusCode == 400) {
        throw Exception(response);
      }

      return response;
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  Future<Response> endOrder(String orderId) async {
    var response = await _client.delete('$_apiUrl/orders/' + orderId,
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      return response;
    }

    return null;
  }

  Future<ResponseFeaturedList> featured() async {
    var response = await _client.get('$_apiUrl/featured/',
        headers: {"Content-Type": "application/json"});

//    List<Product> responseProducts = json.decode(response.body);
//    Iterable l = json.decode(response.body);
//    List<Product> responseProducts =
//        l.map((model) => Product.fromMap(model)).toList();
//
//    ResponseFeaturedList responseFeaturedList =
//        new ResponseFeaturedList(products: responseProducts);

    ResponseFeaturedList responseFeaturedList = ResponseFeaturedList.fromMap(json.decode(response.body));

    if (response.statusCode == 200) {
      return responseFeaturedList;
    }

    return null;
  }
}
