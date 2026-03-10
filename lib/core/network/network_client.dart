import 'package:dio/dio.dart';

import '../constants/api_constants.dart';

class NetworkClient {
  NetworkClient(String baseUrl) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(
          seconds: ApiConstants.connectTimeoutSeconds,
        ),
        receiveTimeout: const Duration(
          seconds: ApiConstants.receiveTimeoutSeconds,
        ),
      ),
    );
  }
  late final Dio _dio;

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
