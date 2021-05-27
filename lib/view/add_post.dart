import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final _titleTxtCtrl = TextEditingController();
  final _bodyTxtCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Title',
              ),
              controller: _titleTxtCtrl,
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              maxLines: 10,
              minLines: 4,
              decoration: InputDecoration(
                labelText: 'Body',
                border: OutlineInputBorder(),
              ),
              controller: _bodyTxtCtrl,
            ),
          ],
        ),
      ),
    );
  }
}
