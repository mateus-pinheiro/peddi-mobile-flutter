class RestaurantOrder {
  String name;
  String cnpj;

  RestaurantOrder({this.name, this.cnpj});

  RestaurantOrder.fromMap(Map<String, dynamic> data)
      : name = data['name'],
        cnpj = data['cnpj'];

  Map<String, dynamic> toJson() => {'name': name, 'cnpj': cnpj};

}