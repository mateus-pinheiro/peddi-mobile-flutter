import 'package:peddi_tont_app/models/product.dart';

class ResponseFeaturedList {
  final List<Product> products;

  ResponseFeaturedList({this.products});

  ResponseFeaturedList.fromMap(Map<String, dynamic> data)
      : products = (data['products'] as List)
            .map((i) => new Product.fromMap(i))
            .toList();

  Map<String, dynamic> toJson() => {'products': products};
}
