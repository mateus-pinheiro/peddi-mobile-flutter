import 'package:flutter/widgets.dart';

import 'package:meta/meta.dart';
import 'package:peddi_tont_app/models/address.dart';
import 'package:peddi_tont_app/models/category.dart';
import 'package:peddi_tont_app/models/contact.dart';
import 'package:peddi_tont_app/models/responsible_employee.dart';

@immutable
class Restaurant {
  final String id;
  final String name;
  final int cnpj;
  final int numberOfTables;
  final int numberOfEmployees;
  final bool status;
  final String image;
  final Address address;
  final List<ResponsibleEmployee> responsibleEmployee;
  final List<Contact> contact;
  final List<Category> categories;

  Restaurant({
    this.id,
    this.name,
    this.cnpj,
    this.numberOfTables,
    this.numberOfEmployees,
    this.status,
    this.image,
    this.categories,
    this.address,
    this.contact,
    this.responsibleEmployee
  });

  Restaurant.fromMap(Map<String, dynamic> data)
      : id = data['_id'],
        name = data['name'],
        cnpj = data['cnpj'],
        numberOfTables = data['numberOfTables'],
        numberOfEmployees = data['numberOfEmployees'],
        status = data['status'],
        image = data['image'],
        address = Address.fromMap(data['address']),
        responsibleEmployee = (data['responsibleEmployee'] as List)
            .map((i) => new ResponsibleEmployee.fromMap(i))
            .toList(),
        contact = (data['contact'] as List)
            .map((i) => new Contact.fromMap(i))
            .toList(),
        categories = (data['categories'] as List)
            .map((i) => new Category.fromMap(i))
            .toList();

  Map<String, dynamic> toJson() => {
        'name': name,
        'cnpj': cnpj,
        'numberOfTables': numberOfTables,
        'numberOfEmployees': numberOfEmployees,
        'status': status,
        'image': image,
        'address': address,
        'responsibleEmployee': responsibleEmployee,
        'contact': contact,
        'categories': categories
      };
}
