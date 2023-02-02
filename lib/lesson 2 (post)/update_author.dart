import 'package:flutter/material.dart';
import 'package:networking/componants.dart';
import 'package:networking/lesson%202%20(post)/api.dart';
import 'package:networking/lesson%202%20(post)/model.dart';

class UpdateAuthor extends StatefulWidget {
  final Author? author;

  const UpdateAuthor(this.author, {super.key});

  @override
  State<UpdateAuthor> createState() => _UpdateAuthorState();
}

class _UpdateAuthorState extends State<UpdateAuthor> {
  var userIdController = TextEditingController();
  var idController = TextEditingController();
  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  GlobalKey<ScaffoldState> updateAuthor = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      userIdController.text = widget.author!.userId;
      titleController.text = widget.author!.title;
      bodyController.text = widget.author!.body;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: updateAuthor,
      appBar: AppBar(
        title: const Text('Update Author'),
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
                  onChanged: (value) {
                    setState(() {
                      value = userIdController.text;
                    });
                  }),
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
                  onChanged: (value) {
                    setState(() {
                      value = titleController.text;
                    });
                  }),
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
                  onChanged: (value) {
                    setState(() {
                      value = bodyController.text;
                    });
                  }),
              const SizedBox(
                height: 20,
              ),
              defaultButton(
                voidCallback: () {
                  widget.author!.userId;
                  widget.author!.title;
                  widget.author!.body;
                  Api.updateAuthor(widget.author!)!.then(
                    (value) {
                      updateAuthor.currentState!.showBottomSheet(
                        (context) => InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            color: Colors.black54,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Hello ${widget.author!.title}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                text: 'update',
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
