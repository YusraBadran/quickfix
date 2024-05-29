import 'dart:convert';
// import 'dart:ffi';

class Category {
  String id;
  String name;
  String description;
  String? logo;
  int state;
  String? serviceId;
  String? subCategoryId;
  bool hasCategoryItem;

  Category({
    required this.id,
    required this.name,
    required this.description,
    this.logo,
    required this.state,
    this.serviceId,
    this.subCategoryId,
    required this.hasCategoryItem,
  });

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        logo: json["logo"],
        state: json["state"],
        serviceId: json["serviceId"],
        subCategoryId: json["subCategoryId"],
        hasCategoryItem: json["hasCategoryItem"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "logo": logo,
        "state": state,
        "serviceId": serviceId,
        "subCategoryId": subCategoryId,
        "hasCategoryItem": hasCategoryItem,
      };
}
