import 'dart:convert';

import 'package:quickfix/core/storage/storage.dart';

class Token {
  // to get the access token
  static Future<String> getAccessToken() async {
    return Storage().readFromUserBox(LocalStorageKeys.token.name);
  }

  // for decoding the token
  static Future<dynamic> decodeToken() async {
    var token = await getAccessToken();
    dynamic user = token.toString().split('.')[1];
    return json.decode(ascii.decode(base64.decode(base64.normalize(user))));
  }

  // for get the user id
  static Future<dynamic> getUserId() async {
    var user = await decodeToken();
    return user['nameid'];
  }

  // for get the userName
  static Future<dynamic> getUserName() async {
    var user = await decodeToken();
    return user['unique_name'];
  }

  // for get the user email
  static Future<dynamic> getUserEmail() async {
    var user = await decodeToken();
    return user['email'];
  }
}
