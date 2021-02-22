// To parse this JSON data, do
//
//     final userDetails = userDetailsFromJson(jsonString);

import 'dart:convert';

UserDetails userDetailsFromJson(String str) =>
    UserDetails.fromJson(json.decode(str));

String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
  UserDetails({
    this.password,
    this.id,
    this.authorities,
    this.enabled,
    this.username,
    this.accountNonExpired,
    this.credentialsNonExpired,
    this.accountNonLocked,
  });

  String password;
  int id;
  List<Authority> authorities;
  bool enabled;
  String username;
  bool accountNonExpired;
  bool credentialsNonExpired;
  bool accountNonLocked;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        password: json["password"],
        id: json["id"],
        authorities: List<Authority>.from(
            json["authorities"].map((x) => Authority.fromJson(x))),
        enabled: json["enabled"],
        username: json["username"],
        accountNonExpired: json["accountNonExpired"],
        credentialsNonExpired: json["credentialsNonExpired"],
        accountNonLocked: json["accountNonLocked"],
      );

  Map<String, dynamic> toJson() => {
        "password": password,
        "id": id,
        "authorities": List<dynamic>.from(authorities.map((x) => x.toJson())),
        "enabled": enabled,
        "username": username,
        "accountNonExpired": accountNonExpired,
        "credentialsNonExpired": credentialsNonExpired,
        "accountNonLocked": accountNonLocked,
      };
}

class Authority {
  Authority({
    this.authority,
  });

  String authority;

  factory Authority.fromJson(Map<String, dynamic> json) => Authority(
        authority: json["authority"],
      );

  Map<String, dynamic> toJson() => {
        "authority": authority,
      };
}
