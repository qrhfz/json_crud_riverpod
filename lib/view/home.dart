// ignore: unused_import
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_crud/model/post_model.dart';
import 'package:json_crud/provider/post_provider.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: PostListView(),
      ),
    );
  }
}

class PostListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final dataPost = watch(postProvider);
    if (dataPost.isNotEmpty) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(dataPost[index].title!),
            subtitle: Text(dataPost[index].body!.toString()),
          );
        },
        itemCount: dataPost.length,
      );
    } else {
      return Text('Kosong');
    }
  }
}
