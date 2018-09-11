import 'package:meta/meta.dart';
import 'package:peddi_tont_app/models/ingredient.dart';

@immutable
class Product {
  final String name;
  final String image;
  final String description;
  final bool featured;
  final double price;
  final List<Ingredient> ingredients;

  Product(
      {this.ingredients,
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
        ingredients =
            (data['ingredients'] == null ? [] : data['ingredients'] as List)
                .map((ing) => new Ingredient.fromMap(ing))
                .toList();

  Map<String, dynamic> toJson() => {
    'name': name,
    'price': price,
    'featured': featured,
    'description': description,
    'ingredients': ingredients,
    'image': image
  };

  String totalProduct (double valor) {
    return "R\$ " + valor.toString()+ " cada";
  }
}
