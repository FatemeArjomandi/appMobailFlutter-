import 'package:dio/dio.dart';

class DioServices {
  Dio dio = Dio();
  Future<dynamic> getMethod(String url) async {
    dio.options.headers['content-type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'Get'))
        .then((response) {
      //log(response.toString());
      return response;
    });
  }

  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    dio.options.headers['content-type'] = 'application/json';
    return await dio
        .post(url,
            data: map,
            options: Options(responseType: ResponseType.json, method: 'POST'))
        .then((value) {
      return value;
    });
  }
}
