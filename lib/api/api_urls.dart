class ApiUrls {
  static const String baseUrl = "https://10.0.2.2:7228/api/";
  // static const String baseUrl = "https://localhost:7228/api/";
  static const String baseImageUrl = "https://10.0.2.2:7228/";
  static const String loginApiUrl = "${baseUrl}identity/login/v1";
  static const String registerApiUrl = "${baseUrl}user/register/v1";
  static const String serviceTypeApiUrl = "${baseUrl}service_type/get_all/v1";
  static const String categoryApiUrl =
      "${baseUrl}category_serviceType/get_by_id/v1?ServiceTypeId=";
  static const String categoryNextApiUrl = "${baseUrl}category/next/v1?Id=";
  static const String categoryPreviousApiUrl =
      "${baseUrl}category/previous/v1?Id=";
}
