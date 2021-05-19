import 'package:dio/dio.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getNewsData(
      {@required String url, @required Map<String, dynamic> query}) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}
