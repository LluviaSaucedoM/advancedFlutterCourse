import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_rest/helpers/http_response.dart';
import 'package:logger/logger.dart';

class AuthenticationAPI {
  final Dio _dio = Dio();
  final Logger _logger = Logger();

  Future<HttpResponse> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        'https://curso-api-flutter.herokuapp.com/api/v1/register',
        data: {
          "username": username,
          "email": email,
          "password": password,
        },
      );
      _logger.i(response.data);
      return HttpResponse.success(response.data);
    } catch (e) {
      _logger.e(e);

      int statusCode = -1; //sin acceso a internet
      String message = 'unknown error';
      dynamic data;

      if (e is DioError) {
        message = e.message;

        if (e.response != null) {
          debugPrint('e response: ${e.response}');
          dynamic res = e.response;
          statusCode = res.statusCode;
          message = res.statusMessage;
          data = res.data;
        }
      }
      return HttpResponse.fail(
          statusCode: statusCode, message: message, data: data);
    }
  }

  Future<HttpResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        'https://curso-api-flutter.herokuapp.com/api/v1/login',
        data: {
          "email": email,
          "password": password,
        },
      );
      _logger.i(response.data);
      return HttpResponse.success(response.data);
    } catch (e) {
      _logger.e(e);

      int statusCode = -1; //sin acceso a internet
      String message = 'unknown error';
      dynamic data;

      if (e is DioError) {
        message = e.message;

        if (e.response != null) {
          debugPrint('e response: ${e.response}');
          dynamic res = e.response;
          statusCode = res.statusCode;
          message = res.statusMessage;
          data = res.data;
        }
      }
      return HttpResponse.fail(
          statusCode: statusCode, message: message, data: data);
    }
  }
}
