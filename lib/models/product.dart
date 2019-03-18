import 'package:meta/meta.dart';
import 'package:peddi_tont_app/models/ingredient.dart';

@immutable
class Product {
  final String id;
  final String mgmtId;
  final String name;
  final String image;
  final String description;
  final int featured;
  final double price;
  final int productCloudId;
  final int sidesLimit;
  final List<Ingredient> ingredients;

  static double toDouble(dynamic value) {
    var d = double.parse(value);
    return d;
  }

  Product(
      {this.id,
      this.productCloudId,
      this.ingredients,
      this.price,
      this.featured,
      this.description,
      this.image,
      this.name,
      this.mgmtId,
      this.sidesLimit})
      : assert(name != null, price != null);

  Product.fromMap(Map<String, dynamic> data)
      : id = data['_id'],
        sidesLimit = data['sides_limit'],
        mgmtId = data['mgmt_id'],
        productCloudId = data['product_cloud_id'],
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
        '_id': id,
        'mgmt_id': mgmtId,
        'product_cloud_id': productCloudId,
        'name': name,
        'price': price,
        'featured': featured,
        'sides_limit': sidesLimit,
        'description': description,
        'ingredients': ingredients,
        'image': image
      };
}
