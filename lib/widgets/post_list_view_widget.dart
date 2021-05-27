import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/provider/post_provider.dart';

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
    var bodyExcerpt = (body.length < 100)
        ? body.replaceAll("\n", " ")
        : body.substring(0, 96).replaceAll("\n", " ") + '...';
    return Text(bodyExcerpt);
  }
}
