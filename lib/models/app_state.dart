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
    new FeaturedList()
  );

  final Restaurant restaurant;
  final Order order;
  final FeaturedList featuredList;
  final BuildContext context;

  AppState(this.restaurant, this.order, this.featuredList, {this.context});

  AppState.fromJson(Map<String, dynamic> json)
      : restaurant = (json['restaurant']),
        order = (json['order']),
        context = (json['context']),
        featuredList = (json['featuredList']);

  Map<String, dynamic> toJson() =>
      {'restaurant': restaurant, 'order': order, 'featuredList': featuredList};
}
