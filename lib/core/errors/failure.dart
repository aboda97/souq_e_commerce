import 'package:dio/dio.dart';
import 'package:souq_app/generated/l10n.dart';

abstract class Failure {
  final String errMsg;

  Failure(this.errMsg);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMsg);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(S.current.connectionTimeout);
      case DioExceptionType.sendTimeout:
        return ServerFailure(S.current.sendTimeout);
      case DioExceptionType.receiveTimeout:
        return ServerFailure(S.current.receiveTimeout);
      case DioExceptionType.badCertificate:
        return ServerFailure(S.current.badCertificate);
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(S.current.requestCancelled);
      case DioExceptionType.connectionError:
        return ServerFailure(S.current.connectionError);
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure(S.current.connectionError);
        }
        return ServerFailure(S.current.unexpectedError);
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(S.current.notFound);
    } else if (statusCode == 500) {
      return ServerFailure(S.current.internalServerError);
    } else {
      return ServerFailure(S.current.generalError);
    }
  }
}
