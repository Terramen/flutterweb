// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Users> usersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.created,
    this.role,
  });

  int id;
  String firstName;
  String lastName;
  String email;
  String password;
  DateTime created;
  Role role;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        role: roleValues.map[json["role"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "created": created == null ? null : created.toIso8601String(),
        "role": roleValues.reverse[role],
      };
}

enum Role { ROLE_ADMIN, ROLE_USER }

final roleValues =
    EnumValues({"ROLE_ADMIN": Role.ROLE_ADMIN, "ROLE_USER": Role.ROLE_USER});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
