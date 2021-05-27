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
    return dataPost.when(
        data: (data) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index].title!),
                subtitle: buildPostBodyExcerpt(data[index].body!.toString()),
                trailing: Icon(Icons.play_arrow),
              );
            },
            itemCount: data.length,
          );
        },
        loading: () => SizedBox(
              child: CircularProgressIndicator(),
              height: 50,
              width: 50,
            ),
        error: (e, s) => Text(e.toString()));
  }

  Widget buildPostBodyExcerpt(String body) {
    var bodyExcerpt =
        (body.length < 100) ? body : body.substring(0, 96) + '...';
    return Text(bodyExcerpt);
  }
}
