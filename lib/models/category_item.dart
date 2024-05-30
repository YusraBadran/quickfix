import 'dart:convert';

class CategoryItem {
  String? id;
  String? name;
  String? description;
  String? logo;
  int? status;
  int? price;
  String? categoryId;
  List<String>? image;

  CategoryItem({
    this.id,
    this.name,
    this.description,
    this.logo,
    this.status,
    this.price,
    this.categoryId,
    this.image,
  });

  factory CategoryItem.fromRawJson(String str) =>
      CategoryItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryItem.fromJson(Map<String, dynamic> json) => CategoryItem(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        logo: json["logo"],
        status: json["status"],
        price: json["price"],
        categoryId: json["categoryId"],
        image: List<String>.from(json["image"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "logo": logo,
        "status": status,
        "price": price,
        "categoryId": categoryId,
        "image": List<dynamic>.from(image!.map((x) => x)),
      };
}
