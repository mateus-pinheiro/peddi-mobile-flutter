import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:peddi_tont_app/models/featured_list.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/models/restaurant.dart';

@immutable
class AppState {
  static var empty = AppState(
    new Restaurant(),
    new Order(),
    new FeaturedList(),
    timerActive: false
  );

  final Restaurant restaurant;
  final Order order;
  final FeaturedList featuredList;
  final BuildContext context;
  final bool timerActive;

  AppState(this.restaurant, this.order, this.featuredList, {this.context, this.timerActive});

  AppState.fromJson(Map<String, dynamic> json)
      : restaurant = (json['restaurant']),
        order = (json['order']),
        context = (json['context']),
        featuredList = (json['featuredList']),
        timerActive = (json['timerActive']);

  Map<String, dynamic> toJson() =>
      {'restaurant': restaurant, 'order': order, 'featuredList': featuredList};
}
