import 'package:meta/meta.dart';
import 'package:peddi_tont_app/models/item.dart';
import 'package:peddi_tont_app/models/restaurant_order.dart';

class Order {
  final int id;
  final int table;
  final int customers;
  double amount;
  String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final RestaurantOrder restaurant;
  final List<Item> items;

  Order(
      {this.id,
      this.table,
      this.customers,
      this.amount,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.restaurant,
      this.items});

  Order.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        table = data['table'],
        customers = data['customers'],
        amount = data['amount'],
        status = data['status'],
        createdAt = data['createdAt'],
        updatedAt = data['updatedAt'],
        restaurant = data['restaurant'],
        items = (data['products'] == null ? [] : data['products'] as List)
            .map((item) => new Item.fromMap(item))
            .toList();

  Map<String, dynamic> toJson() => {
        'table': table,
        'customers': customers,
        'amount': amount,
        'status': status,
        'created_at': createdAt.toString(),
        'updated_at': updatedAt,
        'restaurant': restaurant,
        'products': items
      };
}
