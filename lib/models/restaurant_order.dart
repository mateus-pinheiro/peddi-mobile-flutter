class RestaurantOrder {
  String name;
  int cnpj;

  RestaurantOrder({this.name, this.cnpj});

  Map<String, dynamic> toJson() => {'name': name, 'cnpj': cnpj};

}