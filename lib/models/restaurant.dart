import 'package:flutter/widgets.dart';

import 'package:meta/meta.dart';
import 'package:peddi_tont_app/models/address.dart';
import 'package:peddi_tont_app/models/category.dart';
import 'package:peddi_tont_app/models/manager.dart';
import 'package:peddi_tont_app/models/waiter.dart';

@immutable
class Restaurant {
  final String id;
  final int restaurantCloudId;
  final String token;
  final String name;
  final String cnpj;
  final int tables;
  final int employees;
  final int status;
  final String logoImage;
  final Address address;
  final List<Category> categories;
  final List<Waiter> waiters;
  final List<Manager> managers;

  Restaurant({
    this.id,
    this.restaurantCloudId,
    this.token,
    this.name,
    this.cnpj,
    this.tables,
    this.employees,
    this.status,
    this.logoImage,
    this.categories,
    this.address,
    this.managers,
    this.waiters
  });

  Restaurant.fromMap(Map<String, dynamic> data)
      : id = data['_id'],
        restaurantCloudId = data['restaurant_cloud_id'],
        token = data['token'],
        name = data['name'],
        cnpj = data['cnpj'],
        tables = data['tables'],
        employees = data['employees'],
        status = data['status'],
        logoImage = data['logo_image'],
        address = Address.fromMap(data['address']),
        waiters = (data['waiters'] as List)
            .map((i) => new Waiter.fromMap(i))
            .toList(),
        managers = (data['managers'] as List)
            .map((i) => new Manager.fromMap(i))
            .toList(),
        categories = (data['categories'] as List)
            .map((i) => new Category.fromMap(i))
            .toList();

  Map<String, dynamic> toJson() => {
        'restaurant_cloud_id': restaurantCloudId,
        'token': token,
        'name': name,
        'cnpj': cnpj,
        'tables': tables,
        'employees': employees,
        'status': status,
        'image': logoImage,
        'address': address,
        'waiters': waiters,
        'managers': managers,
        'categories': categories
      };
}
