import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:networking/lesson%201%20(get)/model.dart';

class LessonOne extends StatefulWidget {
  const LessonOne({Key? key}) : super(key: key);

  @override
  State<LessonOne> createState() => _LessonOneState();
}

class _LessonOneState extends State<LessonOne> {
  Future<PostData>? postData;

  @override
  initState() {
    super.initState();
    postData = getPostById();
  }

  // num 1
  Future<PostData> getPostById() async {
    http.Response futurePost = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );
    if (futurePost.statusCode == 200) {
      // decode :  to change String to json
      print(futurePost.body);
      return PostData.fromJson(
        json.decode(futurePost.body),
      );
    } else {
      throw Exception('error bro');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Networking http lesson 1'),
      ),
      // num 3
      body: Center(
        child: FutureBuilder<PostData>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.title!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error!}');
            }
            return const Center(child: CircularProgressIndicator());
          },
          future: postData,
        ),
      ),
    );
  }
}
