import 'dart:developer';

import 'package:dio/dio.dart';

class DioServices {
  Future<dynamic> getMethod(String url) async {
    Dio dio = Dio();

    dio.options.headers['content-type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'Get'))
        .then((response) {
      log(response.toString());
      return response;
    });
  }
}
