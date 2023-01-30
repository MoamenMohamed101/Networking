// import 'package:flutter/material.dart';
// import 'package:networking/componants.dart';
// import 'package:networking/helpoo_project/api.dart';
// import 'package:networking/helpoo_project/register_screen.dart';
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   String? authorName;
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//   var formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Next Author'),
//       ),
//       body: Form(
//         key: formKey,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               defaultFormField(
//                 controller: emailController,
//                 keyboard: TextInputType.emailAddress,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'please enter your email';
//                   }
//                   return null;
//                 },
//                 text: 'Email Address',
//                 prefixIcon: Icons.email,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               defaultFormField(
//                 controller: passwordController,
//                 keyboard: TextInputType.emailAddress,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'please enter your password';
//                   }
//                   return null;
//                 },
//                 text: 'Password',
//                 prefixIcon: Icons.lock,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               defaultButton(
//                 voidCallback: () {
//                   setState(() {
//                     if (formKey.currentState!.validate()) {
//                       Api.userLogin(
//                         emailController.text,
//                         passwordController.text,
//                       );
//                     }
//                   });
//                 },
//                 text: 'Login',
//                 width: double.infinity,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Don\'t have an account ?',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const RegisterScreen(),
//                         ),
//                       );
//                     },
//                     child: const Text('Register'),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// // Column(
// //           children: [
// //             TextField(
// //               decoration: const InputDecoration(
// //                   labelText: 'Author name', hintText: 'Add author name'),
// //               onChanged: (value) {
// //                 setState(() {
// //                   authorName = value;
// //                 });
// //               },
// //             ),
// //             MaterialButton(
// //               onPressed: () {},
// //               color: Colors.blue,
// //               child: const Text(
// //                 'save',
// //                 style: TextStyle(color: Colors.white,fontSize: 20),
// //               ),
// //             )
// //           ],
// //         ),