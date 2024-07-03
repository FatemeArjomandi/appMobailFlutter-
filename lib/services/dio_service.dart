import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_services;

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
    dio.options.headers['content-type'] = 'multipart/form-data';
    return await dio
        .post(url,
            data: dio_services.FormData.fromMap(map),
            options: Options(responseType: ResponseType.json, method: 'POST'))
        .then((value) {
      return value;
    });
  }
}
