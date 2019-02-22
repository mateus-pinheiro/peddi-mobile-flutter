import 'package:meta/meta.dart';

@immutable
class Ingredient {
  final String id;
  final String mgmtId;
  final int type;
  final double price;
  final int cloudId;
  final String name;
  final int action;
  bool isChecked;

  Ingredient({this.action = 2, this.type, this.price, this.name, this.mgmtId, this.cloudId, this.id});

  static double toDouble(dynamic value) {
    if (value != "null") {
      var d = double.parse(value);
      return d;
    }
    return 0.0;
  }

  Ingredient.fromMap(Map<String, dynamic> data)
      : mgmtId = data['mgmt_id'],
        action = 0,
        id = data['_id'],
        cloudId = data['cloud_id'],
        name = data['name'],
        type = data['type'],
        price = toDouble(data['price'].toString());

  Map<String, dynamic> toJson() => {
        'mgmt_id': mgmtId,
        'name': name,
        'price': price,
        'type': type,
        'cloud_id': cloudId,
        '_id' : id,
        'action': 2
      };
}
