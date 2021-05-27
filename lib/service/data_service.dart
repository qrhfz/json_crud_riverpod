import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_crud/model/post_model.dart';

class DataService {
  static const urlApi = 'https://jsonplaceholder.typicode.com/asu';
  final dio = Dio(BaseOptions(baseUrl: urlApi));

  Future<List<PostModel>> readPost() async {
    try {
      var response = await dio.get('/asu/babi/taikucing',
          options: Options(
            responseType: ResponseType.plain,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ));

      var jsonRes = json.decode(response.toString());
      return (jsonRes as List).map((e) => PostModel.fromJson(e)).toList();
    } catch (e) {
      print(e);
      return [];
    }
    //return empty list (you can also return custom error to be handled by Future Builder)
  }
}

final dataServiceProvider = Provider<DataService>((ref) => DataService());
