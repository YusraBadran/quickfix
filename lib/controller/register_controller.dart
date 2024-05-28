import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickfix/api/api_urls.dart';
import 'package:quickfix/api/client/client.dart';
import 'package:quickfix/api/request_model.dart';

class RegisterController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final TextEditingController userStateController = TextEditingController();
  final TextEditingController rolesController = TextEditingController();

  onSubmit() async {
    var response = await Client.callApi(
      apiUrl: ApiUrls.registerApiUrl,
      requestType: RequestTypes.post,
      requestBody: {
        "userName": userNameController.text,
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "phoneNumber": phoneNumberController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "confirmPassword": passwordConfirmController.text,
        "userState": 1,
        "roles": ['user'],
      },
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
