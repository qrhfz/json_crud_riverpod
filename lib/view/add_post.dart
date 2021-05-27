import 'package:flutter/material.dart';
import 'package:json_crud/model/post_model.dart';
import '/service/data_service.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final _titleTxtCtrl = TextEditingController();
  final _bodyTxtCtrl = TextEditingController();
  DataService dataService = DataService();

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
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              onPressed: () async {
                try {
                  var statusCode = await dataService.createPost(
                    PostModel(
                      body: _bodyTxtCtrl.text,
                      title: _titleTxtCtrl.text,
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(statusCode == '201' ? 'Sukses' : 'Gagal')));
                  Navigator.pop(context);
                } on CustomException catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.message)));
                }
              },
              icon: Icon(Icons.send),
              label: Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}
