import 'package:flutter/material.dart';
import 'package:json_crud/model/post_model.dart';
import 'package:json_crud/service/data_service.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DataService dataService = DataService();
  List<PostModel> dataPost = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataService.readPost().then((value) {
      setState(() {
        dataPost = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(dataPost[index].title!),
              subtitle: Text(dataPost[index].userId!.toString()),
            );
          },
          itemCount: dataPost.length,
        ),
      ),
    );
  }
}
