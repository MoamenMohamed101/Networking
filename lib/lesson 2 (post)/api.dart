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

  // num1
  // make it return List<Author> because the data is list of Authors
  static Future<List<Author>> getAuthor() async {
    final Response response = await get(
      Uri.parse('$baseUrl/posts'),
    );
    if (response.statusCode == 200) {
      //printFullText(response.body);
      // parse json into list of object num2
      final parse = json.decode(response.body).cast<Map<String, dynamic>>();
      return parse.map<Author>((item) => Author.fromJson(item)).toList();
    } else {
      throw Exception('Error');
    }
  }
}