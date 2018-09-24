import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:peddi_tont_app/models/sub_category.dart';

@immutable
class Category {
  final String name;
  final String photo;
  final List<SubCategory> subCategory;
  bool isSelected;
  Color isSelectedColor;

  Category({
    this.name,
    this.photo,
    this.subCategory,
  });

  Category.fromMap(Map<String, dynamic> data)
      : name = data['name'],
        photo = data['photo'],
        subCategory = (data['subCategory'] == null ? [] : data['subCategory']  as List).map((i) => new SubCategory.fromMap(i)).toList();

  Map<String, dynamic> toJson() => {
    'name': name,
    'photo': photo,
    'subCategory': subCategory
  };

}


