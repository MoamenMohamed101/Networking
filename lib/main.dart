import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:networking/model.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Post>? postData;

  @override
  initState() {
    super.initState();
    postData = getPostById();
  }

  // num 1
  Future<Post> getPostById() async {
    http.Response futurePost = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
    );
    if (futurePost.statusCode == 200) {
      // decode :  to change String to json
      return Post.fromJson(
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
        child: FutureBuilder<Post>(
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
