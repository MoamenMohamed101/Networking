import 'dart:convert';

import 'package:http/http.dart';
import 'package:networking/lesson%202%20(post)/model.dart';

class Api {
  static String? baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<Author>? createAuthor({
    String? userId,
    String? id,
    String? title,
    String? body,
  }) async {
    final Response response = await post(
      Uri.parse('$baseUrl/posts'),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8'
      },
      body: jsonEncode(
        <String, String>{
          'userId': userId!,
          'id': id!,
          'title': title!,
          'body': body!,
        },
      ),
    );
    if (response.statusCode == 201) {
      print(response.body);
      return Author.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error');
    }
  }
}
