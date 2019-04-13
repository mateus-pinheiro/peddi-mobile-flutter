import 'package:peddi_tont_app/models/product.dart';

class FeaturedList {
  final List<Product> products;

  FeaturedList({this.products});

  FeaturedList.fromMap(Map<String, dynamic> data)
      : products = (data['products'] as List)
      .map((i) => new Product.fromMap(i))
      .toList();

  Map<String, dynamic> toJson() => {'products': products};
}
