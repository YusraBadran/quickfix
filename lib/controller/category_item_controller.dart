import 'package:get/get.dart';
import 'package:quickfix/api/api_urls.dart';
import 'package:quickfix/api/client/client.dart';
import 'package:quickfix/api/request_model.dart';
import 'package:quickfix/models/category_item.dart';

class CategoryItemController extends GetxController {
  List<CategoryItem> categoryItems = [];

  void onGetCategoriesItem(String id) async {
    print(id);
    final response = await await Client.callApi(
      apiUrl: ApiUrls.categoryItemApiUrl + id!,
      requestType: RequestTypes.get,
    );
    response.fold((error) {
      Get.snackbar("Error", error.response.data['detail']);
    }, (success) {
      print(success.data);
      dynamic data = success.data['categoryItem'];
      categoryItems =
          List<CategoryItem>.from(data.map((x) => CategoryItem.fromJson(x)));
      update(['categoriesItem']);
    });
  }

  @override
  void onInit() {
    super.onInit();
  }
}
