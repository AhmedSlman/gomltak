import 'package:dio/dio.dart';

class ApiServes {
  final _baseUrl = 'https://gomltak.com/Backend/api/v1/';
  final Dio _dio;

  ApiServes(this._dio);
  Future<Map<String, dynamic>> get({
    required String endpoint,
    Map<String, dynamic>? data,
    String? token,
    String? lang,
  }) async {
    var response = await _dio.get(
      '$_baseUrl$endpoint',
      data: data,
      options: Options(
        headers: {
          'lang': lang,
          'authorization': 'Bearer $token',
        },
      ),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endpoint,
    required Map<String, dynamic> data,
    String? token,
    String? lang,
  }) async {
    var response = await _dio.post(
      '$_baseUrl$endpoint',
      data: data,
      options: Options(
        headers: {
          'lang': lang,
          'authorization': 'Bearer $token',
        },
      ),
    );

    return response.data;
  }
}
