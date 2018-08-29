import 'package:meta/meta.dart';

@immutable
class Address {
  final int zipCode;
  final String street;
  final int number;
  final String complement;
  final String district;
  final String city;
  final String state;

  Address(
      {this.zipCode,
      this.street,
      this.number,
      this.complement,
      this.district,
      this.city,
      this.state});

  Address.fromMap(Map<String, dynamic> map)
      : zipCode = map['zipcode'],
        street = map['street'],
        number = map['number'],
        complement = map['complement'],
        district = map['district'],
        city = map['city'],
        state = map['state'];

  Map<String, dynamic> toJson() => {
    'zipcode': zipCode,
    'street': street,
    'number': number,
    'complement': complement,
    'district': district,
    'city': city,
    'state': state
  };
}
