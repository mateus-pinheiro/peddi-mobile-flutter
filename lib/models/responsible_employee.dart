class ResponsibleEmployee {
  String epocId;
  String name;

  ResponsibleEmployee({this.epocId, this.name});

  ResponsibleEmployee.fromMap(Map<String, dynamic> data)
      : epocId = data['epocId'],
        name = data['name'];

  Map<String, dynamic> toJson() => {
    'epocId': epocId,
    'name': name
  };

  ResponsibleEmployee copyWith({
    int epocId,
    String name,

  }) {

    return new ResponsibleEmployee(
        epocId: epocId ?? this.epocId,
        name: name ?? this.name,

    );
  }

}
