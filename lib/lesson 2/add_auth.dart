import 'package:flutter/material.dart';

class AddAuthor extends StatefulWidget {
  @override
  State<AddAuthor> createState() => _AddAuthorState();
}

class _AddAuthorState extends State<AddAuthor> {
  String? authorName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Author'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                  labelText: 'Author name', hintText: 'Add author name'),
              onChanged: (value) {
                setState(() {
                  authorName = value;
                });
              },
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.blue,
              child: const Text(
                'save',
                style: TextStyle(color: Colors.white,fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
