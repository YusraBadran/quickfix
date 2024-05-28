import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickfix/api/api_urls.dart';
import 'package:quickfix/api/client/client.dart';
import 'package:quickfix/api/request_model.dart';

class LoginController extends GetxController {
  final TextEditingController userNameEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
      print(error);
      print(error.response);
      print(error.response['data']);
    }, (success) {
      print(success.data);
      dynamic data = success.data['data'];
      print(data);
    });
  }
}
