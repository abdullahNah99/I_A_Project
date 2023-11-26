import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessege;

  const Failure(this.errorMessege);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessege);

  factory ServerFailure.fromDioException(DioException dioError) {
    switch (dioError.type) {
      case DioException.connectionTimeout:
        return ServerFailure('Connection Timeout With Api Server');

      case DioException.sendTimeout:
        return ServerFailure('Send Timeout With Api Server');

      case DioException.receiveTimeout:
        return ServerFailure('Receive Timeout With Api Server');

      case DioException.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response,
        );

      case DioExceptionType.cancel:
        return ServerFailure('Request To Api Server Was Canceled');

      case DioExceptionType.unknown:
        return ServerFailure('Unknown Error, Please Try Later');

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate, Please Try Later');

      case DioExceptionType.connectionError:
        return ServerFailure('Check Your Connection and Try Again');

      default:
        return ServerFailure('Oops, Thers is an Error, Please Try Again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 422) {
      return ServerFailure(response['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your Request Not Found, Please Try Later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error, Please Try Later!');
    } else {
      return ServerFailure('Oops, Thers is an Error, Please Try Again');
    }
  }
}
