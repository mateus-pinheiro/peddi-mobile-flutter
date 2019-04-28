import 'package:peddi_tont_app/models/ingredient.dart';
import 'package:peddi_tont_app/models/product.dart';

class ResponseFeaturedList {
  final String id;
  final List<Product> products;
  final List<Ingredient> ingredients;

  ResponseFeaturedList({this.products, this.id, this.ingredients});

  ResponseFeaturedList.fromMap(Map<String, dynamic> data)
      : id = data['_id'],
        ingredients = (data['ingredients'] as List)
            .map((i) => new Ingredient.fromMap(i))
            .toList(),
        products = (data['bases'] as List)
            .map((i) => new Product.fromMap(i))
            .toList();

  Map<String, dynamic> toJson() => {'products': products};
}
