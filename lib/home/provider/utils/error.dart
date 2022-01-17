// ignore_for_file: unnecessary_this
class ApiException implements Exception {
  final String? message;
  final int? statusCode;
  final dynamic extras;

  ApiException({
    this.statusCode,
    this.message,
    this.extras,
  });

  @override
  String toString() =>
      "\nCode:${this.statusCode}\nMessage:${this.message ?? ''}";
}
