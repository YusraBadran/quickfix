import 'dart:convert';

class Paging<T> {
  int totalItems;
  int page;
  int pageSize;
  int totalPages;
  int currentStartIndex;
  int currentEndIndex;
  bool hasPreviousPage;
  bool hasNextPage;
  List<T> data;
  Paging({
    required this.totalItems,
    required this.page,
    required this.pageSize,
    required this.totalPages,
    required this.currentStartIndex,
    required this.currentEndIndex,
    required this.hasPreviousPage,
    required this.hasNextPage,
    required this.data,
  });
  // Paging.emptyCons();
  factory Paging.fromRawJson(String str) =>
      Paging.fromJson(json.decode(str) as Map<String, dynamic>, (x) => x as T);
  String toRawJson() => json.encode(toJson());
  factory Paging.fromJson(
          Map<String, dynamic> json, T Function(dynamic) fromJsonT) =>
      Paging(
        totalItems: json["totalItems"] ?? 0,
        page: json["page"] ?? 0,
        pageSize: json["pageSize"] ?? 0,
        totalPages: json["totalPages"] ?? 0,
        currentStartIndex: json["currentStartIndex"] ?? 0,
        currentEndIndex: json["currentEndIndex"] ?? 0,
        hasPreviousPage: json["hasPreviousPage"],
        hasNextPage: json["hasNextPage"],
        data: List<T>.from(json["data"].map((x) => fromJsonT(x))),
      );
  Map<String, dynamic> toJson() => {
        "totalItems": totalItems,
        "page": page,
        "pageSize": pageSize,
        "totalPages": totalPages,
        "currentStartIndex": currentStartIndex,
        "currentEndIndex": currentEndIndex,
        "hasPreviousPage": hasPreviousPage,
        "hasNextPage": hasNextPage,
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}
