import 'package:flutter/cupertino.dart';

class Author {
  String? userId;
  String? id;
  String? title;
  String? body;

  Author({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      userId: json['userId'],
      id: json['id'].toString(),
      title: json['title'],
      body: json['body'],
    );
  }
}