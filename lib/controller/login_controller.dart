import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickfix/api/api_urls.dart';
import 'package:quickfix/api/client/client.dart';
import 'package:quickfix/api/request_model.dart';
import 'package:quickfix/core/storage/storage.dart';
import 'package:quickfix/screen/homeScreen.dart';

class LoginController extends GetxController {
  final TextEditingController userNameEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool submit = false.obs;
  onSubmit() async {
    var response = await Client.callApi(
      apiUrl: ApiUrls.loginApiUrl,
      requestType: RequestTypes.post,
      requestBody: {
        "userNameOrEmail": userNameEmailController.text,
        "password": passwordController.text,
        "remember": true,
      },
    );
    response.fold((error) {
      print(error.response.data);
      Get.snackbar("Error", error.response.data['detail'],
          snackPosition: SnackPosition.BOTTOM);
    }, (success) {
      dynamic data = success.data['data'];
      Storage().writeToUserBox(
        LocalStorageKeys.token.name,
        data["accessToken"],
      );
      print(data);
      Get.to(HomeScreen());
    });
  }
}
