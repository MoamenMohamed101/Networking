import 'package:flutter/material.dart';
import 'package:networking/componants.dart';
import 'package:networking/lesson%202%20(post)/api.dart';
import 'package:networking/lesson%202%20(post)/screen.dart';

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
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: addAuthor,
      appBar: AppBar(
        title: const Text('New Author'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              defaultFormField(
                controller: userIdController,
                keyboard: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'userId is empty';
                  }
                },
                text: 'userId',
                prefixIcon: Icons.supervised_user_circle,
              ),
              const SizedBox(
                height: 20,
              ),
              defaultFormField(
                controller: titleController,
                keyboard: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Title is empty';
                  }
                },
                text: 'title',
                prefixIcon: Icons.title,
              ),
              const SizedBox(
                height: 20,
              ),
              defaultFormField(
                controller: bodyController,
                keyboard: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'body is empty';
                  }
                },
                text: 'body',
                prefixIcon: Icons.book,
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
                      .then(
                    (value) {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LessonTwo(),
                          ),
                        );
                      }
                    },
                  );
                },
                text: 'save',
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// showBottomSheet(
//                         (context) => InkWell(
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                           child: Container(
//                             height: 40,
//                             width: double.infinity,
//                             color: Colors.black54,
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 'Hello ${value.title}',
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
