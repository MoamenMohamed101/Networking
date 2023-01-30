import 'package:flutter/material.dart';
import 'package:networking/lesson 2 (post)/add_author.dart';
class LessonTwo extends StatefulWidget {
  const LessonTwo({Key? key}) : super(key: key);

  @override
  State<LessonTwo> createState() => _LessonTwoState();
}

class _LessonTwoState extends State<LessonTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Networking lesson 2'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddAuthor(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}