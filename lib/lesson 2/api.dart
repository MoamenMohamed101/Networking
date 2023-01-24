import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Api {
  static String? loginBaseUrl =
      'https://api.backendless.com/application-id/CLOUDCODE-api-key/users';
  static String? registerBaseUrl =
      'https://xxxx.backendless.app/api/users';

  static Future userLogin(String? email, String? password) async {
    Response response = await post(
      Uri.parse('$loginBaseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        <String , String>{
          "email": email!,
          "password": password!,
        },
      ),
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw Exception(
          'Failed Login with status code ${response.statusCode}');
    }
    return const CircularProgressIndicator();
  }

  static Future userRegister(
    String? email,
    String? password,
    String? name,
    String? phone,
  ) async {
    Response response = await post(
      Uri.parse('$registerBaseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        <String , String>{
          "email": email!,
          "password": password!,
          "name": name!,
          "phone": phone!,
        },
      ),
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw Exception(
          'Failed Register with status code ${response.statusCode}');
    }
    return const CircularProgressIndicator();
  }
}
// moamen@gmail.com
