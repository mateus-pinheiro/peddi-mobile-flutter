import 'package:meta/meta.dart';

@immutable
class Manager {
  final String id;
  final int managerCloudId;
  final String name;
  final String username;
  final String email;
  final int status;

  Manager(
      {this.id,
      this.managerCloudId,
      this.name,
      this.username,
      this.status,
      this.email});

  Manager.fromMap(Map<String, dynamic> map)
      : id = map['_id'],
        managerCloudId = map['manager_cloud_id'],
        name = map['name'],
        username = map['username'],
        email = map['email'],
        status = map['status'];

  Map<String, dynamic> toJson() => {
        '_id': id,
        'manager_cloud_id': managerCloudId,
        'name': name,
        'username': username,
        'email': email,
        'status': status
      };
}
