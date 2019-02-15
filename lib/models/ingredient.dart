import 'package:meta/meta.dart';

@immutable
class Ingredient {
  final String id;
  final String mgmtId;
  final int type;
  final double price;
  final int ingredientCloudId;
  final String name;
  bool isChecked;

  Ingredient({this.type, this.price, this.name, this.mgmtId, this.ingredientCloudId, this.id});

  static double toDouble(dynamic value) {
    if (value != "null") {
      var d = double.parse(value);
      return d;
    }
    return 0.0;
  }

  Ingredient.fromMap(Map<String, dynamic> data)
      : mgmtId = data['mgmt_id'],
        id = data['_id'],
        ingredientCloudId = data['ingredient_cloud_id'],
        name = data['name'],
        type = data['type'],
        price = toDouble(data['price'].toString());

  Map<String, dynamic> toJson() => {
        'mgmt_id': mgmtId,
        'name': name,
        'price': price,
        'type': type,
        'ingredient_cloud_id': ingredientCloudId,
        '_id' : id
      };
}
