import 'dart:convert';

class OAuth {
  //TODO: OAuth: add fields, fromJson, toJson

  String id;
  String displayName;
  String applicationName;
  String? installUrl;
  String? uninstallUrl;
  dynamic data;

  OAuth({
    required this.id,
    required this.displayName,
    required this.applicationName,
    this.installUrl,
    this.uninstallUrl,
    this.data,
  });

  factory OAuth.fromJson(String str) => OAuth.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OAuth.fromMap(Map<String, dynamic> json) => OAuth(
        id: json["id"],
        displayName: json["display_name"],
        applicationName: json["application_name"],
        installUrl: json["install_url"],
        uninstallUrl: json["uninstall_url"],
        data: json['data'],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "display_name": displayName,
        "application_name": applicationName,
        "install_url": installUrl,
        "uninstall_url": uninstallUrl,
        "data": data.toMap(),
      };
}
