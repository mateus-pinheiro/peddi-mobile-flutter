import 'package:meta/meta.dart';

@immutable
class Ingredient {
  final String type;
  final double price;
  final String name;
  bool isChecked;

  Ingredient({this.type, this.price, this.name});


  Ingredient.fromMap(Map<String, dynamic> data)
      : name = data['name'],
        type = data['type'],
        price = data['price'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'price': price,
    'type': type,
  };

}
