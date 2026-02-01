import 'package:dio/dio.dart';

class ApiServices {
  final String _baseUrl = 'https://api.quotable.io/';
  final Dio _dio;
  ApiServices(this._dio);

  Future<Map<String, dynamic>> get(String endpoint) async {
      Response response = await _dio.get('$_baseUrl$endpoint');
      return response.data;
  }
}
