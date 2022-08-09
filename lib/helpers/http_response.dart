class HttpResponse {
  final dynamic data;
  final dynamic error;

  HttpResponse(this.data, this.error);

  static HttpResponse success(dynamic data) => HttpResponse(data, null);
  static HttpResponse fail({
    required int statusCode,
    required String message,
    required dynamic data,
  }) =>
      HttpResponse(null,
          HttpError(data: data, message: message, statusCode: statusCode));
}

class HttpError {
  final int statusCode;
  final String message;
  final dynamic data;

  HttpError({
    required this.statusCode,
    required this.message,
    required this.data,
  });
}
