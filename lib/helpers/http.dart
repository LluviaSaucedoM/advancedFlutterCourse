import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:flutter_api_rest/helpers/http_response.dart';

class Http {
  late Dio _dio;
  late Logger _logger;
  // ignore: unused_field
  late bool _logsEnabled;

  Http({
    required Dio dio,
    required Logger logger,
    required bool logsEnabled,
  }) {
    _dio = dio;
    _logger = logger;
    _logsEnabled = logsEnabled;
  }

  Future<HttpResponse<T>> request<T>(
    String path, {
    String method = 'GET',
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
    T Function(dynamic data)? parser,
  }) async {
    try {
      final response = await _dio.request(
        path,
        options: Options(
          method: method,
          headers: headers,
        ),
        queryParameters: queryParameters,
        data: data,
      );

      if (parser != null) {
        return HttpResponse.success<T>(parser(response.data));
      }
      return HttpResponse.success<T>(response.data);
    } catch (e) {
      int statusCode = 0; //sin acceso a internet
      String message = 'unknown error';
      dynamic data;

      if (e is DioError) {
        message = e.message;

        if (e.response != null) {
          dynamic res = e.response;
          statusCode = res.statusCode;
          message = res.statusMessage;
          data = res.data;
        }
      }
      return HttpResponse.fail<T>(
          statusCode: statusCode, message: message, data: data);
    }
  }
}
