import 'package:flutter/material.dart';
import 'package:networking/componants.dart';
import 'package:networking/helpoo_project/api.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? authorName;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              defaultFormField(
                controller: nameController,
                keyboard: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter your name';
                  }
                  return null;
                },
                text: 'name',
                prefixIcon: Icons.person,
              ),
              const SizedBox(
                height: 20,
              ),
              defaultFormField(
                controller: phoneController,
                keyboard: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter your phone';
                  }
                  return null;
                },
                text: 'phone',
                prefixIcon: Icons.phone,
              ),
              const SizedBox(
                height: 20,
              ),
              defaultButton(
                voidCallback: () {
                  setState(() {
                    if (formKey.currentState!.validate()) {
                      Api.userRegister(
                        emailController.text,
                        passwordController.text,
                        nameController.text,
                        phoneController.text,
                      );
                    }
                  });
                },
                text: 'Register',
                width: double.infinity,
              ),
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
