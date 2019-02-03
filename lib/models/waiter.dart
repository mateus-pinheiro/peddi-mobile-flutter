class Waiter {
  String mgmtId;
  String name;

  Waiter({this.mgmtId, this.name});

  Waiter.fromMap(Map<String, dynamic> data)
      : mgmtId = data['mgmt_id'],
        name = data['name'];

  Map<String, dynamic> toJson() => {'mgmt_id': mgmtId, 'name': name};

  Waiter copyWith({
    String mgmtId,
    String name,
  }) {
    return new Waiter(
      mgmtId: mgmtId?? this.mgmtId,
      name: name ?? this.name,
    );
  }
}
