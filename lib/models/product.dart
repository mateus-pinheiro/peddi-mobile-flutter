import 'package:meta/meta.dart';
import 'package:peddi_tont_app/models/ingredient.dart';

@immutable
class Product {
  final int epocId;
  final String name;
  final String image;
  final String description;
  final bool featured;
  final double price;
  final List<Ingredient> ingredients;

  static double toDouble(dynamic value) {
    var d = double.parse(value);
    return d;
  }

  Product(
      {this.ingredients,
      this.price,
      this.featured,
      this.description,
      this.image,
      this.name,
      this.epocId})
      : assert(name != null, price != null);

  Product.fromMap(Map<String, dynamic> data)
      : epocId = data['epoc_id'],
        name = data['name'],
        price = toDouble(data['price'].toString()),
        featured = data['featured'],
        image = data['image'],
        description = data['description'],
        ingredients =
            (data['ingredients'] == null ? [] : data['ingredients'] as List)
                .map((ing) => new Ingredient.fromMap(ing))
                .toList();

  Map<String, dynamic> toJson() => {
        'epoc_id': epocId,
        'name': name,
        'price': price,
        'featured': featured,
        'description': description,
        'ingredients': ingredients,
        'image': image
      };
}
