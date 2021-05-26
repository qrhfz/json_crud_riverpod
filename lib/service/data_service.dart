import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:json_crud/model/post_model.dart';

class DataService {
  static const urlApi = 'https://jsonplaceholder.typicode.com/';
  final dio =
      Dio(BaseOptions(baseUrl: urlApi, responseType: ResponseType.plain));
  Future<List<PostModel>> readPost() async {
    try {
      var response = await dio.get('/posts');

      var jsonRes = json.decode(response.toString());
      return (jsonRes as List).map((e) => PostModel.fromJson(e)).toList();
    } on DioError catch (e) {
      String errorMessage = "sumting wong dengan status code :";
      var statusCode =
          (e.response != null) ? e.response!.statusCode.toString() : '??';
      throw new Exception(errorMessage + statusCode);
    }
  }
}
