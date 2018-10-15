import 'package:meta/meta.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/models/rating.dart';
import 'package:peddi_tont_app/models/restaurant.dart';

@immutable
class AppState {
  static var empty = AppState(
    new Restaurant(),
    new Order(),
    new Rating(),
  );

  final Restaurant restaurant;
  final Order order;
  final Rating rating;

  AppState(this.restaurant, this.order, this.rating);

  AppState.fromJson(Map<String, dynamic> json)
      : restaurant = (json['restaurant']),
        order = (json['order']),
        rating = (json['rating']);

  Map<String, dynamic> toJson() => {'restaurant': restaurant, 'order': order,'rating':rating};

}
