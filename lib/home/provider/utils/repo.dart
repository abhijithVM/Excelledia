import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' show DioError, DioErrorType;
import 'package:excelledia/home/provider/utils/error.dart';
import 'package:excelledia/home/provider/utils/failure.dart';

typedef RemoteExecutable<T> = Future<T> Function();

// ignore: missing_return
Future<Either<Failure, T>> repoExecute<T>(RemoteExecutable<T> func) async {
  try {
    final T result = await func();
    return Right(result);
  } on DioError catch (err) {
    final ex = err.error;
    if (ex is ApiException) {
      return Left(ApiFailure.fromException(ex));
    } else {
      switch (err.type) {
        case DioErrorType.connectTimeout:
          return const Left(ConnectionTimeout());
        case DioErrorType.sendTimeout:
          return const Left(ConnectionTimeout());
        case DioErrorType.receiveTimeout:
          return const Left(ConnectionTimeout());
        case DioErrorType.response:
          return const Left(ConnectionTimeout());
        case DioErrorType.cancel:
          return const Left(ConnectionTimeout());
        case DioErrorType.other:
          return const Left(NetworkFailure());
      }
    }
  } on TypeError catch (_) {
    return const Left(NetworkFailure(message: "Failed to process data."));
  } catch (exception) {
    return const Left(ConnectionTimeout(title: "Unexpected Failure"));
  }
}
