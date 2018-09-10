import 'package:meta/meta.dart';
import 'package:peddi_tont_app/models/ingredient.dart';

@immutable
class Product {
  final String name;
  final String image;
  final String description;
  final bool featured;
  final int price;
  final List<Ingredient> ingredient;

  Product(
      {this.ingredient,
      this.price,
      this.featured,
      this.description,
      this.image,
      this.name})
      : assert(name != null, price != null);

  Product.fromMap(Map<String, dynamic> data)
      : name = data['name'],
        price = data['price'],
        featured = data['featured'],
        image = data['image'],
        description = data['description'],
        ingredient =
            (data['ingredient'] == null ? [] : data['ingredient'] as List)
                .map((ing) => new Ingredient.fromMap(ing))
                .toList();

  Map<String, dynamic> toJson() => {
    'name': name,
    'price': price,
    'featured': featured,
    'description': description,
    'ingredient': ingredient,
    'image': image
  };

  String totalProduct (int valor) {
    return "R\$ " + valor.toString()+ " cada";
  }
}
