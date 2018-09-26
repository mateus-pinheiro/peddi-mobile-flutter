import 'package:meta/meta.dart';
import 'package:peddi_tont_app/models/item.dart';
import 'package:peddi_tont_app/models/responsible_employee.dart';
import 'package:peddi_tont_app/models/restaurant_order.dart';

class Order {
  final int id;
  final int table;
  final int customers;
  double amount;
  String status;
  ResponsibleEmployee responsibleEmployee;
  final DateTime createdAt;
  final DateTime updatedAt;
  final RestaurantOrder restaurant;
  final int ticket;
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
      this.ticket,
      this.items,
      this.responsibleEmployee});

  Order.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        table = data['table'],
        customers = data['customers'],
        amount = data['amount'],
        status = data['status'],
        createdAt = data['createdAt'],
        updatedAt = data['updatedAt'],
        restaurant = data['restaurant'],
        ticket = data['ticket'],
        responsibleEmployee = data['responsibleEmployee'],
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
        'ticket': ticket,
        'responsibleEmployee': responsibleEmployee,
        'products': items
      };

  Order copyWith({
    int id,
    int table,
    int customers,
    double amount,
    String status,
    ResponsibleEmployee responsibleEmployee,
    DateTime createdAt,
    DateTime updatedAt,
    RestaurantOrder restaurant,
    int ticket,
    List<Item> items,
  }) {

    return new Order(
        table: table ?? this.table,
        customers: customers ?? this.customers,
        amount: amount ?? this.amount,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        restaurant: restaurant ?? this.restaurant,
        ticket: ticket ?? this.ticket,
        responsibleEmployee: responsibleEmployee ?? this.responsibleEmployee,
        items: items ?? this.items
    );
  }
}
