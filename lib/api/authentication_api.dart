import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class AuthenticationAPI {
  final Dio _dio = Dio();
  final Logger _logger = Logger();

  Future<void> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final response = await _dio.post(
        'https://curso-api-flutter.herokuapp.com/api/v1/register',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: {
          "username": username,
          "email": email,
          "password": password,
        },
      );
      _logger.i(response.data);
    } catch (e) {
      _logger.i(e);
    }
  }
}
