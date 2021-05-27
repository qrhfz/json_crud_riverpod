// ignore: unused_import
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '/model/post_model.dart';
import '/service/data_service.dart';
import '/widgets/post_list_view_widget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DataService dataService = DataService();
  List<PostModel> dataPost = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: PostListView(),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        // color: Theme.of(context).accentColor,
        width: double.infinity,
        child: IconButton(
          icon: Icon(Icons.add_box),
          color: Theme.of(context).accentColor,
          onPressed: () {
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //   content: Text('boop'),
            //   duration: Duration(milliseconds: 500),
            // ));
          },
        ),
      ),
    );
  }
}
