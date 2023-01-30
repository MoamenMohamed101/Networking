// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
//
// class Api {
//   static String? baseUrl =
//       'https://xxxx.backendless.app/api/users/';
//   static Future userLogin(String? email, String? password) async {
//     Response response = await post(
//       Uri.parse('$baseUrl/login'),
//       headers: {'Content-Type' : 'application/json;charset=UTF-8'},
//       body: json.encode(
//         <String , String>{
//           "email": email!,
//           "password": password!,
//         },
//       ),
//     );
//
//     if (response.statusCode == 200) {
//       print(response.body);
//     } else {
//       throw Exception(
//           'Failed Login with status code ${response.statusCode}');
//     }
//     return const CircularProgressIndicator();
//   }
//
//   static Future userRegister(
//     String? email,
//     String? password,
//     String? name,
//     String? phone,
//   ) async {
//     Response response = await post(
//       Uri.parse('$baseUrl/register'),
//       headers: {'Content-Type' : 'application/json;charset=UTF-8'},
//       body: json.encode(
//         <String , String>{
//           "email": email!,
//           "password": password!,
//           "name": name!,
//           "phone": phone!,
//         },
//       ),
//     );
//
//     if (response.statusCode == 200) {
//       print(response.body);
//     } else {
//       throw Exception(
//           'Failed Register with status code ${response.statusCode}');
//     }
//     return const CircularProgressIndicator();
//   }
// }
// // moamen@gmail.com