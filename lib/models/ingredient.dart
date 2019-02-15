import 'package:meta/meta.dart';

@immutable
class Ingredient {
  final int epocId;
  final int type;
  final double price;
  final String name;
  bool isChecked;

  Ingredient({this.type, this.price, this.name, this.epocId});

  static double toDouble(dynamic value) {
    if (value != "null") {
      var d = double.parse(value);
      return d;
    }
    return 0.0;
  }

  Ingredient.fromMap(Map<String, dynamic> data)
      : epocId = data['epoc_id'],
        name = data['name'],
        type = data['type'],
        price = toDouble(data['price'].toString());

  Map<String, dynamic> toJson() => {
        'epoc_id': epocId,
        'name': name,
        'price': price,
        'type': type,
      };
}
