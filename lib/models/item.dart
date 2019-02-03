import 'package:peddi_tont_app/models/ingredient.dart';

class Item {

  String epocId;
  String name;
  int qtyItem;
  double price;
  double amount;
  List<Ingredient> ingredients;

  Item(
      {this.epocId, this.name, this.qtyItem, this.price, this.amount, this.ingredients});


  Map<String, dynamic> toJson() => {
    'epoc_id': epocId,
    'name': name,
    'amount': amount,
    'quantity': qtyItem,
    'price': price,
    'ingredients': ingredients
  };

  Item.fromMap(Map<String, dynamic> data)
      : name = data['name'],
        price = data['price'],
        epocId = data['epoc_id'],
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