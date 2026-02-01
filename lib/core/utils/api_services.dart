import 'package:dio/dio.dart';
import 'package:quotes_generator_app/core/utils/api_keys.dart';

class ApiServices {
  final String _baseUrl = Endpoints.baseUrl;
  final Dio _dio;
  ApiServices(this._dio);

  Future<Map<String, dynamic>> get(String endpoint) async {
      Response response = await _dio.get('$_baseUrl$endpoint');
      return response.data;
  }
}
