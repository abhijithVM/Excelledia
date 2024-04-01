// ignore_for_file: annotate_overrides, overridden_fields
import 'package:equatable/equatable.dart';
import 'error.dart';

abstract class Failure extends Equatable {
  final String message;
  final String title;

  const Failure(this.message, this.title);

  @override
  List<Object> get props => [title, message];

  @override
  String toString() => title;
}

class NetworkFailure extends Failure {
  const NetworkFailure({
    String title = "NetworkFailure",
    String message = "",
  }) : super(message, title);
}

class ApiFailure extends Failure {
  final int statusCode;

  final String message;
  final dynamic extras;

  const ApiFailure({
    this.statusCode = 500,
    this.message = kMessageConnectionTimeout,
    this.extras,
  }) : super(message, "ServerFailure");

  factory ApiFailure.fromException(ApiException exception) => ApiFailure(
        message: exception.message ?? kMessageConnectionTimeout,
        statusCode: exception.statusCode!,
        extras: exception.extras,
      );

  @override
  List<Object> get props => [statusCode, message];
}

class ConnectionTimeout extends Failure {
  const ConnectionTimeout({
    String message = kMessageConnectionTimeout,
    String title = "ConnectionTimeout",
  }) : super(message, title);
}

const kMessageConnectionTimeout =
    "It looks like something unexpected has occurred on our end.";
