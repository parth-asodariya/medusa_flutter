import 'dart:convert';

class StorePostCustomersReq {
  String? email;
  String? first_name;
  String? last_name;
  String? password;
  String? phone;

  StorePostCustomersReq({
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.password,
    this.phone,
  });

  factory StorePostCustomersReq.fromJson(String str) =>
      StorePostCustomersReq.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StorePostCustomersReq.fromMap(Map<String, dynamic> json) =>
      StorePostCustomersReq(
        email: json["email"],
        first_name: json["first_name"],
        last_name: json["last_name"],
        password: json["password"],
        phone: json["phone"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "first_name": first_name,
        "last_name": last_name,
        "password": password,
        "phone": phone,
      };
}
