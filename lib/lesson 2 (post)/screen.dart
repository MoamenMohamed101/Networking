import 'package:flutter/material.dart';
import 'package:networking/lesson 2 (post)/add_author.dart';
import 'package:networking/lesson%202%20(post)/api.dart';
import 'package:networking/lesson%202%20(post)/model.dart';

class LessonTwo extends StatefulWidget {
  const LessonTwo({Key? key}) : super(key: key);

  @override
  State<LessonTwo> createState() => _LessonTwoState();
}

class _LessonTwoState extends State<LessonTwo> {
  Future<List<Author>>? author;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    author = Api.getAuthor();
  }
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
          setState(() {
            author = Api.getAuthor();
          });
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Author>>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(snapshot.data![index].title!),
                  subtitle: Row(
                    children: [
                      Text(snapshot.data![index].userId),
                      const SizedBox(width: 300),
                      Text(snapshot.data![index].id),
                    ],
                  ),
                ),
              ),
              itemCount: snapshot.data!.length,
            );
          } else if (snapshot.hasError) {
            print(snapshot.error.toString());
            return const Text('Error with Api');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        future: author,
      ),
    );
  }
}
