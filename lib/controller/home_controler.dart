import 'package:get/get.dart';
import 'package:quickfix/api/api_urls.dart';
import 'package:quickfix/api/client/client.dart';
import 'package:quickfix/api/request_model.dart';
import 'package:quickfix/controller/categories_controller.dart';
import 'package:quickfix/models/service_type.dart';

class HomeController extends GetxController {
  CategoriesController controller = Get.put(CategoriesController());
  List<ServiceType>? services;
  onGetService() async {
    var response = await Client.callApi(
      apiUrl: ApiUrls.serviceTypeApiUrl,
      requestType: RequestTypes.get,
    );
    response.fold((error) {
      print(error);
      print(error.response);
      Get.snackbar("Error", error.response.data['detail']);
    }, (success) {
      print(success.data);
      dynamic data = success.data['serviceType'];
      services =
          List<ServiceType>.from(data.map((x) => ServiceType.fromJson(x)));
      print(services);
      update(['services']);
    });
  }

  @override
  void onInit() {
    onGetService();
    super.onInit();
  }
}
