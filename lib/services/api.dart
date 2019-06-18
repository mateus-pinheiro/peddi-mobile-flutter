import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  static const String _apiUrl = 'http://192.168.0.70:8000/api';

// CASA
//  static const String _apiUrl = 'http://192.168.15.15:8000/api';

// IP FITFOOD
//  static const String _apiUrl = 'http://192.168.0.123:8000/api';

  final http.Client _client = http.Client();

  Future<Restaurant> getRestaurant() async {
    try {
      // load json file from root bundle instead of DefaultAssetBundle so that context doesn't
      // have to be passed in.
      final String _restaurantString = await rootBundle.loadString('mock/restaurant.json');
      final Map<String, dynamic> _restaurantMap = json.decode(_restaurantString);
      return Restaurant.fromMap(_restaurantMap);
    } on Exception catch (e) {
      return null;
    }
  }

  Future<ResponseOpenOrder> openOrder(Order order) async {
    // var jsonEncoded = json.encode(order.toJson());
    // try {
    //   var request = await _client.post('$_apiUrl/orders/',
    //       headers: {"Content-Type": "application/json"}, body: jsonEncoded);

    //   if (request.statusCode == 400) {
    //     throw Exception(request);
    //   }

    //   ResponseOpenOrder responseOpenOrder =
    //       ResponseOpenOrder.fromMap(json.decode(request.body));

    //   return responseOpenOrder;
    // } on Exception catch (e) {
    //   return Future.error(e);
    // }
    final ResponseOpenOrder mockId = ResponseOpenOrder.fromMap({'id': 'random id'});
    return mockId;
  }

  Future<dynamic> askOrder(AskOrderBody order) async {
    return [];
  }

  Future<dynamic> endOrder(String orderId) async {
    return [];
  }

  Future<ResponseFeaturedList> featured() async {
    try {
      // load json file from root bundle instead of DefaultAssetBundle so that context doesn't
      // have to be passed in.
      final String _featuredString = await rootBundle.loadString('mock/featured.json');
      final Map<String, dynamic> _featuredMap = json.decode(_featuredString);
      return ResponseFeaturedList.fromMap(_featuredMap);
    } on Exception catch (e) {
      return null;
    }
  }
}
