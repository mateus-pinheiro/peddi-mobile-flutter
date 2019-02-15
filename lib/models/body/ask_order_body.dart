import 'package:peddi_tont_app/models/consumer.dart';

class AskOrderBody {
  String id;
  double orderPrice;
  DateTime updatedAt;
  List<Consumer> consumers;

  AskOrderBody({this.id, this.orderPrice, this.consumers, this.updatedAt});

  Map<String, dynamic> toJson() => {
        'order_price': orderPrice,
        'updated_at': updatedAt.toString(),
        'consumers': consumers
      };

  AskOrderBody.fromMap(Map<String, dynamic> data)
      : orderPrice = data['order_price'],
        updatedAt = data['updated_at'],
        consumers = (data['consumers'] == null ? [] : data['consumers'] as List)
            .map((item) => new Consumer.fromMap(item))
            .toList();

  AskOrderBody copyWith({
    String id,
    double orderPrice,
    DateTime updatedAt,
    List<Consumer> consumers,
  }) {
    return new AskOrderBody(
        id: id ?? this.id,
        orderPrice: orderPrice ?? this.orderPrice,
        updatedAt: updatedAt ?? this.updatedAt,
        consumers: consumers ?? this.consumers);
  }
}
