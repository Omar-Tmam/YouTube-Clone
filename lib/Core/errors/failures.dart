import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate Error');
      case DioExceptionType.badResponse:
        final response = dioError.response;
        if (response != null) {
          return ServerFailure.fromResponse(
              response.statusCode ?? 0, response.data);
        } else {
          return ServerFailure('Unknown bad response error');
        }
      case DioExceptionType.cancel:
        return ServerFailure('Request Cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error');
      case DioExceptionType.unknown:
        if (dioError.message?.contains('SocketException') == true) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unknown Error');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['detail'] ?? 'Authentication Error');
    } else if (statusCode == 404) {
      return ServerFailure('Method not found');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error');
    } else {
      return ServerFailure('Something went wrong, please try again later');
    }
  }
}
