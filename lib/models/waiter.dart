class Waiter {
  String id;
  int waiterCloudId;
  String name;
  String qrCode;
  int status;

  Waiter({this.waiterCloudId, this.name, this.qrCode, this.status, this.id});

  Waiter.fromMap(Map<String, dynamic> data)
      : waiterCloudId = data['waiter_cloud_id'],
        name = data['name'],
        id = data['_id'],
        qrCode = data['QRcode'],
        status = data['status'];

  Map<String, dynamic> toJson() => {
        '_id': id,
        'waiter_cloud_id': waiterCloudId,
        'name': name,
        'QRcode': qrCode,
        'status': status
      };

  Waiter copyWith({
    String id,
    int waiterCloudId,
    String name,
    String qrCode,
    int status

  }) {
    return new Waiter(
      waiterCloudId: waiterCloudId ?? this.waiterCloudId,
      name: name ?? this.name,
      qrCode: qrCode ?? this.qrCode,
      status: status ?? this.status,
      id: id ?? this.id
    );
  }
}
