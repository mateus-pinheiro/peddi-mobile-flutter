import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:peddi_tont_app/models/product.dart';
import 'package:peddi_tont_app/models/sub_category.dart';

@immutable
class Category {
  final String id;
  final String name;
  final int categoryCloudId;
  final String image;
  final List<SubCategory> subcategories;
  final List<Product> products;

  bool isSelected;
  Color isSelectedColor;

  Category(
      {this.id,
      this.name,
      this.categoryCloudId,
      this.image,
      this.subcategories,
      this.products, this.isSelected, this.isSelectedColor});

  Category.fromMap(Map<String, dynamic> data)
      : id = data['_id'],
        name = data['name'],
        categoryCloudId = data['category_cloud_id'],
        image = data['image'],
        subcategories =
            (data['subcategories'] == null ? [] : data['subcategories'] as List)
                .map((i) => new SubCategory.fromMap(i))
                .toList(),
        products = (data['products'] == null ? [] : data['products'] as List)
            .map((i) => new Product.fromMap(i))
            .toList();

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'categoryCloudId': categoryCloudId,
        'image': image,
        'subcategories': subcategories,
        'products' : products
      };
}
