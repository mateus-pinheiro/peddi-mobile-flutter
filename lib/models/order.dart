import 'package:meta/meta.dart';
import 'package:peddi_tont_app/models/product.dart';

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
  final List<Product> products;

  Order({this.id, this.table, this.customers, this.amount, this.status,
      this.createdAt, this.updatedAt, this.restaurant, this.products});

  Map<String, dynamic> toJson() => {
        'table': table,
        'customers': customers,
        'amount': amount,
        'status': status,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'restaurant': restaurant,
        'products': products
      };
}

class RestaurantOrder {
  String name;
  int cnpj;

  RestaurantOrder(this.name, this.cnpj);

  Map<String, dynamic> toJson() => {'name': name, 'cnpj': cnpj};

}
