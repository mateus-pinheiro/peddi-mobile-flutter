import 'package:meta/meta.dart';

@immutable
class Ingredient {
  final int epocId;
  final String type;
  final double price;
  final String name;
  bool isChecked;

  Ingredient({this.type, this.price, this.name, this.epocId});


  Ingredient.fromMap(Map<String, dynamic> data)
      : epocId = data['epoc_id'],
        name = data['name'],
        type = data['type'],
        price = data['price'];

  Map<String, dynamic> toJson() => {
    'epoc_id': epocId,
    'name': name,
    'price': price,
    'type': type,
  };

}
