import 'package:get/get.dart';
import 'package:quickfix/api/api_urls.dart';
import 'package:quickfix/api/client/client.dart';
import 'package:quickfix/api/request_model.dart';
import 'package:quickfix/controller/home_controler.dart';
import 'package:quickfix/models/categories.dart';
import 'package:quickfix/models/service_type.dart';
import 'package:quickfix/screen/pages/category_page.dart';
import 'package:quickfix/screen/pages/home.dart';

class CategoriesController extends GetxController {
  List<Category> categories = [];

  void onGetCategories(String id) async {
    print(id);
    final response = await await Client.callApi(
      apiUrl: ApiUrls.categoryApiUrl + id!,
      requestType: RequestTypes.get,
    );
    response.fold((error) {
      Get.snackbar("Error", error.response.data['detail']);
    }, (success) {
      print(success.data);
      dynamic data = success.data['category'];
      categories = [];
      categories = List<Category>.from(data.map((x) => Category.fromJson(x)));
      update(['categories']);
    });
  }

  void onGetNextCategories(String Id) async {
    print(Id);
    final response = await await Client.callApi(
      apiUrl: ApiUrls.categoryNextApiUrl + Id,
      requestType: RequestTypes.get,
    );
    response.fold((error) {
      Get.snackbar("Error", error.response['data']['message']);
    }, (success) {
      dynamic data = success.data['category'];
      categories = [];
      categories = List<Category>.from(data.map((x) => Category.fromJson(x)));
      update(['categories']);
    });
  }

  void onGetPreviousCategories(String Id) async {
    print(Id);
    final response = await await Client.callApi(
      apiUrl: ApiUrls.categoryPreviousApiUrl + Id,
      requestType: RequestTypes.get,
    );
    response.fold((error) {
      Get.snackbar("Error", error.response.data['detail']);
    }, (success) {
      // if (success.data['category'] == null) {
      //   controller.onGetService();
      // } else {
      dynamic data = success.data['category'];
      categories = [];
      categories = List<Category>.from(data.map((x) => Category.fromJson(x)));
      update(['categories']);
      Get.to(CategoryPage());
      // }
    });
  }

  void onGetByPage(String Id) async {
    print(Id);
    final response = await await Client.callApi(
      apiUrl: ApiUrls.categoryPreviousApiUrl + Id,
      requestType: RequestTypes.get,
    );
    response.fold((error) {
      Get.snackbar("Error", error.response.data['detail']);
    }, (success) {
      // if (success.data['category'] == null) {
      //   controller.onGetService();
      // } else {
      dynamic data = success.data['category'];
      categories = [];
      categories = List<Category>.from(data.map((x) => Category.fromJson(x)));
      update(['categories']);
      // Get.to(CategoryPage());
      // }
    });
  }
}
