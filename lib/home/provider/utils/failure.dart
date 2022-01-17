import 'package:equatable/equatable.dart';

import 'error.dart';

abstract class Failure extends Equatable {
  final String message;
  final String title;

  Failure(this.message, this.title);

  @override
  List<Object> get props => [this.title, this.message];

  @override
  String toString() => this.title;
}

class NetworkFailure extends Failure {
  NetworkFailure({
    String message = kMessageNetworkDown,
    String title = "NetworkFailure",
  }) : super(message, title);
}

class ServerFailure extends Failure {
  ServerFailure({
    String message = kMessageServerFailure,
    String title = "ServerFailure",
  }) : super(message, title);
}

class ConnectionTimeout extends Failure {
  ConnectionTimeout({
    String message = kMessageConnectionTimeout,
    String title = "ConnectionTimeout",
  }) : super(message, title);
}

class ApiFailure extends Failure {
  final int statusCode;
  final String message;
  final dynamic extras;

  ApiFailure({
    this.statusCode = 500,
    this.message = kMessageServerFailure,
    this.extras,
  }) : super(message, "ServerFailure");

  factory ApiFailure.fromException(ApiException exception) => ApiFailure(
        message: exception.message ?? kMessageServerFailure,
        statusCode: exception.statusCode!,
        extras: exception.extras,
      );

  @override
  List<Object> get props => [statusCode, message];
}

class CacheFailure extends Failure {
  CacheFailure({String message = "Cache Failure"})
      : super(message, "CacheFailure");
}

class FileLoadFailure extends Failure {
  FileLoadFailure({String message = "Unable to load file"})
      : super(message, "FileLoadFailure");
}

class PaymentFailure extends Failure {
  final String paymentInfo;
  PaymentFailure(
      {String message = kMessagePaymentFailure, required this.paymentInfo})
      : super(message, "PaymentFailure");
}

///Looks like we couldn't connect to the RGC network. Please check whether your connection is fine and try again.
const kMessageNetworkDown =
    "Looks like we couldn't connect to the RGC network. Please check whether your connection is fine and try again.";

///We're trying to connect to the RGC network but it looks like it's taking longer than usual. Please check whether your connection is fine and try again.
const kMessageConnectionTimeout =
    "Looks like we couldn't connect to the RGC network within time. Please check whether your connection is fine and try again.";

///We're sorry. It looks like something unexpected has occurred on our end. If you can use button below to give us some additional details, it would really help. We will contact you shortly to help you on your way.
const kMessageServerFailure =
    "We're sorry. It looks like something unexpected has occurred on our end. If you can use button below to give us some additional details, it would really help. We will contact you shortly to help you on your way.";

///We're sorry. It looks like your payment has failed. Please visit the \"Payment history\" section in \"Settings\" to raise a complaint.
const kMessagePaymentFailure =
    "We're sorry. It looks like your payment has failed. Please visit the \"Payment history\" section in \"Settings\" to raise a complaint.";
