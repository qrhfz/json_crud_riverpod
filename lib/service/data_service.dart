import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_crud/model/post_model.dart';

class DataService {
  static const urlApi = 'https://jsonplaceholder.typicode.com';
  final dio = Dio(BaseOptions(baseUrl: urlApi));

  Future<List<PostModel>> readPost() async {
    var response = await dio.get(
      '/posts',
      options: Options(
        responseType: ResponseType.plain,
      ),
    );

    var jsonRes = json.decode(response.toString());
    return (jsonRes as List).map((e) => PostModel.fromJson(e)).toList();
  }
}

final dataServiceProvider = Provider<DataService>((ref) => DataService());
