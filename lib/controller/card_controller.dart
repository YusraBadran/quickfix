import 'package:get/get.dart';
import 'package:quickfix/api/api_urls.dart';
import 'package:quickfix/api/client/client.dart';
import 'package:quickfix/api/client/token.dart';
import 'package:quickfix/api/request_model.dart';
import 'package:quickfix/models/category_item.dart';
import 'package:quickfix/models/order.dart';

class CardController extends GetxController {
  List<Order>? orders;
  List<Detail>? detail;
  List<CategoryItem>? order;
  // CategoryItem? categoryItem;
  onOrderSend() async {
    var response = await Client.callApi(
      apiUrl: ApiUrls.serviceTypeApiUrl,
      requestType: RequestTypes.post,
      requestBody: {
        "status": 0,
        "totalPrice": 0,
        "note": "string",
        "phone": "7777777777",
        "date": DateTime.now().toIso8601String(),
        "userId": await Token.getUserId(),
        "address": {
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "location": "string",
          "longitude": 42.21,
          "latitude": 32.654,
          "description": "string"
        },
        "details": detail,
      },
    );
    response.fold((error) {
      print(error);
      print(error.response);
      Get.snackbar("Error", error.response.data['detail']);
    }, (success) {
      update(['services']);
    });
  }

  @override
  void onInit() {
    super.onInit();
  }
}
