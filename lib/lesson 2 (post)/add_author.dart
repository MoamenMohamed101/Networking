import 'package:flutter/material.dart';
import 'package:networking/componants.dart';
import 'package:networking/lesson%202%20(post)/api.dart';

class AddAuthor extends StatefulWidget {
  const AddAuthor({Key? key}) : super(key: key);

  @override
  State<AddAuthor> createState() => _AddAuthorState();
}

class _AddAuthorState extends State<AddAuthor> {
  var userIdController = TextEditingController();
  var idController = TextEditingController();
  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  GlobalKey<ScaffoldState> addAuthor = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: addAuthor,
      appBar: AppBar(
        title: const Text('New Author'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: userIdController,
              decoration: const InputDecoration(
                labelText: 'userId',
              ),
            ),
            // TextField(
            //   controller: idController,
            //   decoration: const InputDecoration(
            //     labelText: 'id',
            //   ),
            // ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'title',
              ),
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(
                labelText: 'body',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            defaultButton(
              voidCallback: () {
                Api.createAuthor(
                  userId: userIdController.text,
                  id: idController.text,
                  title: titleController.text,
                  body: bodyController.text,
                )!
                    .then((value) {
                  addAuthor.currentState!.showBottomSheet(
                    (context) => Container(
                      height: 40,
                      width: double.infinity,
                      color: Colors.black54,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'The title is ${value.title}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                });
              },
              text: 'save',
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
