import 'package:meta/meta.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/models/restaurant.dart';

@immutable
class AppState {
  static var empty = AppState(
    new Restaurant(),
    new Order(),
  );

  final Restaurant restaurant;
  final Order order;

  AppState(this.restaurant, this.order);


  AppState.fromJson(Map<String, dynamic> json)
      : restaurant = (json['restaurant']),
        order = (json['order']);

  Map<String, dynamic> toJson() => {'restaurant': restaurant, 'order': order};

}
