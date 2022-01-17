import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String? message;
  final int? statusCode;
  final dynamic extras;
  final RequestOptions? requestOptions;

  ApiException({
    this.statusCode,
    this.requestOptions,
    this.message,
    this.extras,
  });

  @override
  String toString() =>
      "\nCode:${this.statusCode}\nMessage:${this.message ?? ''}\nRequest\n---${requestOptions?.toText()}\n---\n";
}

extension on RequestOptions {
  String toText() {
    return "\nurl:${this.path}\nmethod:${this.method}\ndata:${this.data.toString()}\nqParm:${this.queryParameters.toString()}";
  }
}
