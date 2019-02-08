class ResponseOpenOrder {
  final String id;
//  final String msg;

  ResponseOpenOrder(
      {this.id});

  ResponseOpenOrder.fromMap(Map<String, dynamic> data)
      : id = data['id'];

  Map<String, dynamic> toJson() => {
    'id': id
  };

}