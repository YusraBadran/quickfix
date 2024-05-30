import 'package:get/get.dart';
import 'package:quickfix/api/api_urls.dart';
import 'package:quickfix/api/client/client.dart';
import 'package:quickfix/api/request_model.dart';
import 'package:quickfix/models/category_item_detail.dart';

class CategoryItemDetailController extends GetxController {
  CategoryItemDetail? categoryItemDetail;

  void onGetCategoriesItem(String id) async {
    print(id);
    final response = await await Client.callApi(
      apiUrl: ApiUrls.categoryItemDetailApiUrl + id!,
      requestType: RequestTypes.get,
    );
    response.fold((error) {
      Get.snackbar("Error", error.response.data['detail']);
    }, (success) {
      print(success.data);
      dynamic data = success.data['categoryItem'];
      categoryItemDetail = CategoryItemDetail.fromJson(data);
      update(['categoriesItem']);
    });
  }

  @override
  void onInit() {
    super.onInit();
  }
}
