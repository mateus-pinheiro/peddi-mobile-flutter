import 'package:meta/meta.dart';
import 'package:peddi_tont_app/models/item.dart';
import 'package:peddi_tont_app/models/restaurant_order.dart';

@immutable
class Order {
  final int id;
  final String table;
  final String customers;
  final String amount;
  final bool status;
  final DateTime createdAt;
  final String updatedAt;
  final RestaurantOrder restaurant;
  final List<Item> items;

  Order({this.id, this.table, this.customers, this.amount, this.status,
      this.createdAt, this.updatedAt, this.restaurant, this.items});

  Map<String, dynamic> toJson() => {
        'table': table,
        'customers': customers,
        'amount': amount,
        'status': status,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'restaurant': restaurant,
        'items': items
      };
}




