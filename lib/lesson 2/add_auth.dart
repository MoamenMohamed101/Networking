import 'package:flutter/material.dart';
import 'package:networking/componants.dart';
import 'package:networking/lesson%202/api.dart';

class AddAuthor extends StatefulWidget {
  const AddAuthor({super.key});

  @override
  State<AddAuthor> createState() => _AddAuthorState();
}

class _AddAuthorState extends State<AddAuthor> {
  String? authorName;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Author'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              defaultFormField(
                controller: emailController,
                keyboard: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter your email';
                  }
                  return null;
                },
                text: 'Email Address',
                prefixIcon: Icons.email,
              ),
              const SizedBox(
                height: 20,
              ),
              defaultFormField(
                controller: passwordController,
                keyboard: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter your password';
                  }
                  return null;
                },
                text: 'Password',
                prefixIcon: Icons.lock,
              ),
              const SizedBox(
                height: 20,
              ),
              defaultButton(
                  voidCallback: () {
                    if (formKey.currentState!.validate()) {
                      Api.userLogin(
                          emailController.text, passwordController.text);
                    }
                  },
                  text: 'Login',
                  width: double.infinity)
            ],
          ),
        ),
      ),
    );
  }
}
// Column(
//           children: [
//             TextField(
//               decoration: const InputDecoration(
//                   labelText: 'Author name', hintText: 'Add author name'),
//               onChanged: (value) {
//                 setState(() {
//                   authorName = value;
//                 });
//               },
//             ),
//             MaterialButton(
//               onPressed: () {},
//               color: Colors.blue,
//               child: const Text(
//                 'save',
//                 style: TextStyle(color: Colors.white,fontSize: 20),
//               ),
//             )
//           ],
//         ),
