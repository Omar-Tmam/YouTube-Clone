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
        return ServerFailure(
            'Connection Timeout - Please check your internet connection');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Request Send Timeout - Please try again');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Response Timeout - Please try again');
      case DioExceptionType.badCertificate:
        return ServerFailure('Security Certificate Error');
      case DioExceptionType.badResponse:
        final response = dioError.response;
        if (response != null) {
          return ServerFailure.fromResponse(
              response.statusCode ?? 0, response.data);
        } else {
          return ServerFailure('Invalid server response');
        }
      case DioExceptionType.cancel:
        return ServerFailure('Request was cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection available');
      case DioExceptionType.unknown:
        if (dioError.message?.contains('SocketException') == true) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected error occurred');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    try {
      // Handle different response formats
      String errorMessage = _extractErrorMessage(response);

      switch (statusCode) {
        case 400:
          return ServerFailure(errorMessage.isNotEmpty
              ? errorMessage
              : 'Bad Request - Invalid parameters');
        case 401:
          return ServerFailure(errorMessage.isNotEmpty
              ? errorMessage
              : 'Unauthorized - Please check API credentials');
        case 403:
          return ServerFailure(errorMessage.isNotEmpty
              ? errorMessage
              : 'Access Forbidden - API quota exceeded or invalid key');
        case 404:
          return ServerFailure(
              errorMessage.isNotEmpty ? errorMessage : 'Content not found');
        case 429:
          return ServerFailure('Too many requests - Please try again later');
        case 500:
          return ServerFailure(
              'Internal Server Error - Please try again later');
        case 502:
          return ServerFailure(
              'Bad Gateway - Server is temporarily unavailable');
        case 503:
          return ServerFailure('Service Unavailable - Please try again later');
        default:
          return ServerFailure(errorMessage.isNotEmpty
              ? errorMessage
              : 'Something went wrong (Error: $statusCode)');
      }
    } catch (e) {
      return ServerFailure('Error processing server response');
    }
  }

  // Helper method to extract error message from different response formats
  static String _extractErrorMessage(dynamic response) {
    if (response == null) return '';

    try {
      // Handle Map response (most common)
      if (response is Map<String, dynamic>) {
        // Try different possible error message keys
        if (response.containsKey('error')) {
          final error = response['error'];
          if (error is Map<String, dynamic>) {
            return error['message'] ?? error['detail'] ?? '';
          } else if (error is String) {
            return error;
          }
        }

        // Try other common error keys
        return response['message'] ??
            response['detail'] ??
            response['error_description'] ??
            '';
      }

      // Handle String response
      if (response is String) {
        return response;
      }

      // Handle List response (less common)
      if (response is List && response.isNotEmpty) {
        final firstItem = response.first;
        if (firstItem is String) {
          return firstItem;
        } else if (firstItem is Map<String, dynamic>) {
          return firstItem['message'] ?? firstItem['detail'] ?? '';
        }
      }
    } catch (e) {
      // If parsing fails, return empty string
      return '';
    }

    return '';
  }
}

// Optional: Custom exception for API-specific errors
class YouTubeApiFailure extends Failure {
  final String? errorCode;

  YouTubeApiFailure(super.errMessage, {this.errorCode});

  factory YouTubeApiFailure.quotaExceeded() {
    return YouTubeApiFailure('API quota exceeded. Please try again later.',
        errorCode: 'QUOTA_EXCEEDED');
  }

  factory YouTubeApiFailure.invalidApiKey() {
    return YouTubeApiFailure(
        'Invalid API key. Please check your configuration.',
        errorCode: 'INVALID_API_KEY');
  }
}
