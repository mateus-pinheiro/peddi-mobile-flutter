import 'package:peddi_tont_app/models/ingredient.dart';

class Item {

  String mgmtId;
  int baseCloudId;
  String name;
  int qtyItem;
  double basePrice;
  double itemPrice;
  int maxChoices;
  List<Ingredient> ingredients;

  Item(
      {this.mgmtId, this.baseCloudId, this.name, this.qtyItem, this.basePrice, this.itemPrice, this.ingredients, this.maxChoices});


  Map<String, dynamic> toJson() => {
    'mgmt_id': mgmtId,
    'base_cloud_id' : baseCloudId,
    'name': name,
    'item_price': itemPrice,
    'quantity': qtyItem,
    'base_price': basePrice,
    'ingredients': ingredients
  };

  Item.fromMap(Map<String, dynamic> data)
      : name = data['name'],
        basePrice = data['base_price'],
        mgmtId = data['mgmt_id'],
        itemPrice = data['item_price'],
        qtyItem = data['quantity'],
        maxChoices = data['maxChoices'],
        ingredients =
        (data['ingredients'] == null ? [] : data['ingredients'] as List)
            .map((ing) => new Ingredient.fromMap(ing))
            .toList();

  String productPrice (double valor) {
    return "R\$ " + valor.toString()+ " cada";
  }

}