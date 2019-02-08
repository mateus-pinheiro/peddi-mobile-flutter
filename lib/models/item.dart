import 'package:peddi_tont_app/models/ingredient.dart';

class Item {

  String mgmtId;
  int baseCloudId;
  String name;
  int qtyItem;
  double price;
  double amount;
  List<Ingredient> ingredients;

  Item(
      {this.mgmtId, this.baseCloudId, this.name, this.qtyItem, this.price, this.amount, this.ingredients});


  Map<String, dynamic> toJson() => {
    'mgmt_id': mgmtId,
    'base_cloud_id' : baseCloudId,
    'name': name,
    'amount': amount,
    'quantity': qtyItem,
    'item_price': price,
    'ingredients': ingredients
  };

  Item.fromMap(Map<String, dynamic> data)
      : name = data['name'],
        price = data['price'],
        mgmtId = data['mgmtId'],
        amount = data['amount'],
        qtyItem = data['quantity'],
        ingredients =
        (data['ingredient'] == null ? [] : data['ingredient'] as List)
            .map((ing) => new Ingredient.fromMap(ing))
            .toList();

  String productPrice (double valor) {
    return "R\$ " + valor.toString()+ " cada";
  }

}