import 'package:peddi_tont_app/models/ingredient.dart';

class Item {

  String idEpoc;
  String name;
  int qtyItem;
  double price;
  double amount;
  List<Ingredient> ingredients;

  Item(
      {this.idEpoc, this.name, this.qtyItem, this.price, this.amount, this.ingredients});


  Map<String, dynamic> toJson() => {
    'idEpoc': idEpoc,
    'name': name,
    'amount': amount,
    'qtyItem': qtyItem,
    'price': price,
    'ingredients': ingredients
  };

  Item.fromMap(Map<String, dynamic> data)
      : name = data['name'],
        price = data['price'],
        idEpoc = data['featured'],
        amount = data['image'],
        qtyItem = data['description'],
        ingredients =
        (data['ingredient'] == null ? [] : data['ingredient'] as List)
            .map((ing) => new Ingredient.fromMap(ing))
            .toList();



}