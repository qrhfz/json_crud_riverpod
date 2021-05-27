import 'package:flutter/material.dart';
import 'package:json_crud/view/add_post.dart';
import 'package:json_crud/view/home.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case '/add_post':
        return MaterialPageRoute(builder: (_) => AddPost());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

const String addPostRoute = '/add_post';
