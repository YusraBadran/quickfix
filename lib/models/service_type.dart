import 'dart:convert';

class ServiceType {
  String id;
  String name;
  String? logo;
  String description;
  int status;

  ServiceType({
    required this.id,
    required this.name,
    this.logo,
    required this.description,
    required this.status,
  });

  factory ServiceType.fromRawJson(String str) =>
      ServiceType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        description: json["description"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "description": description,
        "status": status,
      };
}
