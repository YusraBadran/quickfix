import 'package:get/get.dart';
import 'package:quickfix/api/api_urls.dart';
import 'package:quickfix/api/client/client.dart';
import 'package:quickfix/api/request_model.dart';

class HomeController extends GetxController {
  onGetService() async {
    var response = await Client.callApi(
      apiUrl: ApiUrls.serviceTypeApiUrl,
      requestType: RequestTypes.get,
    );
    response.fold((error) {
      print(error);
      print(error.response);
      print(error.response['data']);
      Get.snackbar("Error", error.response['data']['message']);
    }, (success) {
      print(success.data);
      dynamic data = success.data['data'];
      print(data);
    });
  }
}
