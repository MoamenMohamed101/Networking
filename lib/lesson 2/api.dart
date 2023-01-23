import 'dart:convert';

import 'package:http/http.dart';

class Api {
  static String? baseUrl =
      'https://api.backendless.com/application-id/CLOUDCODE-api-key/users';

  static Future userLogin(String? email, String? password) async {
    final Response response = await post(Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "email": email,
          "password": password,
        }));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Error');
    }
    return response;
  }
}