import 'package:dio/dio.dart';
import '../constants/api_constants.dart';

class NetworkClient {
  late final Dio _dio;

  NetworkClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.geoBaseUrl,
        connectTimeout: const Duration(
          seconds: ApiConstants.connectTimeoutSeconds,
        ),
        receiveTimeout: const Duration(
          seconds: ApiConstants.receiveTimeoutSeconds,
        ),
      ),
    );
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response =
          await _dio.get(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}