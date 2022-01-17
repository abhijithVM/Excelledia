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
          return Left(ConnectionTimeout());
        case DioErrorType.sendTimeout:
          return Left(ConnectionTimeout());
        case DioErrorType.receiveTimeout:
          return Left(ConnectionTimeout());
        case DioErrorType.response:
          return Left(ServerFailure());
        case DioErrorType.cancel:
          return Left(ServerFailure());
        case DioErrorType.other:
          return Left(NetworkFailure());
      }
    }
  } on TypeError catch (_) {
    return Left(NetworkFailure(message: "Failed to process data."));
  } catch (exception) {
    return Left(ServerFailure(title: "Unexpected Failure"));
  }
}
