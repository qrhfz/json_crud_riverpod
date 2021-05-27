import 'dart:convert';
// import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:json_crud/model/post_model.dart';

class DataService {
  static const urlApi = 'https://jsonplaceholder.typicode.com';
  final dio = Dio(BaseOptions(baseUrl: urlApi));

  Future<List<PostModel>> readPost() async {
    try {
      var response = await dio.get(
        '/posts',
        options: Options(
          responseType: ResponseType.plain,
        ),
      );

      var jsonRes = json.decode(response.toString());
      return (jsonRes as List).map((e) => PostModel.fromJson(e)).toList();
    } on DioError catch (e) {
      throw new CustomException(message: 'Dio Error gan');
    } on Exception catch (e) {
      throw new CustomException(message: 'Error gan');
    }
  }

  Future createPost(PostModel post) async {
    try {
      var response = await dio.post(
        '/posts',
        data: {
          'title': post.title,
          'body': post.body,
          'userId': 1,
        },
        options: Options(
          responseType: ResponseType.plain,
          headers: {'Content-type': 'application/json; charset=UTF-8'},
        ),
      );

      print('Respons create: ' + response.toString());
    } on DioError catch (_) {
      throw new CustomException(message: 'Dio Error gan');
    } on Exception catch (_) {
      throw new CustomException(message: 'Error gan');
    }
  }
}

final dataServiceProvider = Provider<DataService>((ref) => DataService());

class CustomException implements Exception {
  String message;
  CustomException({
    required this.message,
  });
}
