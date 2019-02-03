import 'package:meta/meta.dart';

@immutable
class Address {
  final String id;
  final String zipCode;
  final String district;
  final String street;
  final String city;
  final String state;

  Address(
      {this.id,
      this.zipCode,
      this.street,
      this.district,
      this.city,
      this.state});

  Address.fromMap(Map<String, dynamic> map)
      : id = map['_id'],
        zipCode = map['zipcode'],
        street = map['street'],
        district = map['district'],
        city = map['city'],
        state = map['state'];

  Map<String, dynamic> toJson() => {
        '_id' : id,
        'zipcode': zipCode,
        'street': street,
        'district': district,
        'city': city,
        'state': state
      };
}
