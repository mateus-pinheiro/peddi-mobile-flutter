
import 'package:meta/meta.dart';

@immutable
class Contact {
  final String name;
  final String description;
  final int phone;
  final String email;

  Contact({this.name, this.description, this.phone, this.email});

  Contact.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        description = map['description'],
        phone = map['phone'],
        email= map['email'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'phone': phone,
    'email': email
  };
}
