import 'package:meta/meta.dart';
import 'package:peddi_tont_app/models/product.dart';

@immutable
class SubCategory {
  final List<Product> products;
  final String name;

  SubCategory({this.products, this.name});


  SubCategory.fromMap(Map<String, dynamic> data)
      : name = data['name'],
        products = (data['products'] as List).map((i) => new Product.fromMap(i)).toList();

  Map<String, dynamic> toJson() => {
    'name': name,
    'products': products
  };

}
