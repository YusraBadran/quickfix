import 'package:get/get.dart';
import 'package:quickfix/api/api_urls.dart';
import 'package:quickfix/api/client/client.dart';
import 'package:quickfix/api/request_model.dart';
import 'package:quickfix/models/categories.dart';

class CategoriesController extends GetxController {
  List<Category>? categories;

  void onGetCategories(String id) async {
    print(id);
    final response = await await Client.callApi(
      apiUrl: ApiUrls.categoryApiUrl + id!,
      requestType: RequestTypes.get,
    );
    response.fold((error) {
      print(error.response.data);
      Get.snackbar("Error", error.response.data['detail']);
    }, (success) {
      print(success.data);
      dynamic data = success.data['category'];
      categories = List<Category>.from(data.map((x) => Category.fromJson(x)));
      print(categories);
      update(['categories']);
    });
  }

  void onGetNextCategories(String Id) async {
    final response = await await Client.callApi(
      apiUrl: ApiUrls.categoryNextApiUrl + Id,
      requestType: RequestTypes.get,
    );
    response.fold((error) {
      print(error);
      print(error.response);
      print(error.response['data']);
      Get.snackbar("Error", error.response['data']['message']);
    }, (success) {
      print(success.data);
      dynamic data = success.data['category'];
      categories = List<Category>.from(data.map((x) => Category.fromJson(x)));
      print(categories);
      update(['categories']);
    });
  }

  void onGetPreviousCategories(String Id) async {
    final response = await await Client.callApi(
      apiUrl: ApiUrls.categoryPreviousApiUrl + Id,
      requestType: RequestTypes.get,
    );
    response.fold((error) {
      print(error);
      print(error.response);
      print(error.response['data']);
      Get.snackbar("Error", error.response['data']['message']);
    }, (success) {
      dynamic data = success.data['category'];
      print(data);
      categories = List<Category>.from(data.map((x) => Category.fromJson(x)));
      print(categories);
      update(['categories']);
    });
  }

  @override
  void onInit() {
    super.onInit();
  }
}
