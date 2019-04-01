import 'package:peddi_tont_app/models/consumer.dart';
import 'package:peddi_tont_app/models/item.dart';
import 'package:peddi_tont_app/models/waiter.dart';
import 'package:peddi_tont_app/models/restaurant_order.dart';

class Order {
  final String id;
  final int table;
  final int guests;
  double amountPrice;
  int status;
  Waiter waiter;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int restaurantCloudId;
  final List<Consumer> consumers;
  int productAddedCounter;

  Order(
      {this.id,
      this.table,
      this.guests,
      this.amountPrice,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.restaurantCloudId,
      this.consumers,
      this.waiter});

  Order.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        table = data['table'],
        guests = data['guests'],
        amountPrice = data['amount_price'],
        status = data['status'],
        createdAt = data['created_at'],
        updatedAt = data['updated_at'],
        restaurantCloudId = data['restaurant_cloud_id'],
        waiter = data['waiter_cloud_id'],
        consumers = (data['consumers'] == null ? [] : data['consumers'] as List)
            .map((consumer) => new Consumer.fromMap(consumer))
            .toList();

  Map<String, dynamic> toJson() => {
        'id' : id,
        'table': table,
        'guests': guests,
        'amount_price': amountPrice,
        'status': status,
        'created_at': createdAt.toString(),
        'updated_at': updatedAt,
        'restaurant_cloud_id': restaurantCloudId,
        'waiter_cloud_id': waiter,
        'consumers': consumers
      };

  Order copyWith({
    String id,
    int table,
    int guests,
    double amountPrice,
    int status,
    Waiter waiter,
    DateTime createdAt,
    DateTime updatedAt,
    int restaurantCloudId,
    List<Consumer> consumers,
  }) {

    return new Order(
        id: id ?? this.id,
        table: table ?? this.table,
        guests: guests ?? this.guests,
        amountPrice: amountPrice ?? this.amountPrice,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        restaurantCloudId: restaurantCloudId ?? this.restaurantCloudId,
        waiter: waiter ?? this.waiter,
        consumers: consumers ?? this.consumers
    );
  }
}
