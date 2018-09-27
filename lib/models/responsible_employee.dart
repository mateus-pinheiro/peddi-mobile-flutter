class ResponsibleEmployee {
  int epocId;
  String name;

  ResponsibleEmployee({this.epocId, this.name});

  ResponsibleEmployee.fromMap(Map<String, dynamic> data)
      : epocId = data['epoc_id'],
        name = data['name'];

  Map<String, dynamic> toJson() => {'epoc_id': epocId, 'name': name};

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
