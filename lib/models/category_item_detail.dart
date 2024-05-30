import 'dart:convert';

class CategoryItemDetail {
  String id;
  String name;
  String description;
  int status;
  int price;
  String categoryId;
  Category category;
  List<String> image;

  CategoryItemDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.price,
    required this.categoryId,
    required this.category,
    required this.image,
  });

  factory CategoryItemDetail.fromRawJson(String str) =>
      CategoryItemDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryItemDetail.fromJson(Map<String, dynamic> json) =>
      CategoryItemDetail(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        status: json["status"],
        price: json["price"],
        categoryId: json["categoryId"],
        category: Category.fromJson(json["category"]),
        image: List<String>.from(json["image"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "status": status,
        "price": price,
        "categoryId": categoryId,
        "category": category.toJson(),
        "image": List<dynamic>.from(image.map((x) => x)),
      };
}

class Category {
  String id;
  String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
