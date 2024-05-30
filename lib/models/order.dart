import 'dart:convert';

class Order {
  int status;
  int totalPrice;
  String note;
  String phone;
  DateTime date;
  String userId;
  Address address;
  List<Detail> details;

  Order({
    required this.status,
    required this.totalPrice,
    required this.note,
    required this.phone,
    required this.date,
    required this.userId,
    required this.address,
    required this.details,
  });

  factory Order.fromRawJson(String str) => Order.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        status: json["status"],
        totalPrice: json["totalPrice"],
        note: json["note"],
        phone: json["phone"],
        date: DateTime.parse(json["date"]),
        userId: json["userId"],
        address: Address.fromJson(json["address"]),
        details:
            List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalPrice": totalPrice,
        "note": note,
        "phone": phone,
        "date": date.toIso8601String(),
        "userId": userId,
        "address": address.toJson(),
        "details": List<dynamic>.from(details.map((x) => x.toJson())),
      };
}

class Address {
  String id;
  String location;
  int longitude;
  int latitude;
  String description;

  Address({
    required this.id,
    required this.location,
    required this.longitude,
    required this.latitude,
    required this.description,
  });

  factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        location: json["location"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "location": location,
        "longitude": longitude,
        "latitude": latitude,
        "description": description,
      };
}

class Detail {
  String categoryItemId;
  String note;

  Detail({
    required this.categoryItemId,
    required this.note,
  });

  factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        categoryItemId: json["categoryItemId"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "categoryItemId": categoryItemId,
        "note": note,
      };
}
