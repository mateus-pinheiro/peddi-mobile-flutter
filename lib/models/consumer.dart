import 'package:peddi_tont_app/models/item.dart';

class Consumer {

  int card;
  List<Item> items;

  Consumer(
      {this.card, this.items});

  Map<String, dynamic> toJson() => {
    'card': card,
    'items': items,
  };

  Consumer.fromMap(Map<String, dynamic> data)
      : card = data['card'],
        items =
        (data['items'] == null ? [] : data['items'] as List)
            .map((item) => new Item.fromMap(item))
            .toList();


  Consumer copyWith({
    int card,
    List<Item> items,
  }) {

    return new Consumer(
        card: card ?? this.card,
        items: items ?? this.items
    );
  }

}