import 'dart:io';
import 'package:dio/dio.dart';

class NetworkService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl:
          "https://ecommerceapi-1-zks2.onrender.com/", // change to your API base
      connectTimeout: const Duration(minutes: 1), // timeout
      receiveTimeout: const Duration(minutes: 1),
    ),
  );

  NetworkService() {
    // Setup interceptors
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print("➡ Request: ${options.method} ${options.path}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print(" Response: ${response.statusCode} ${response.statusMessage}");
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        print(" Error: ${e.message}");
        if (e.response == null) {
          e.response?.data = {"message": "Damnnnn", "data": "No"};
        }
        if (e.response?.statusCode == 400) {
          e.response?.data = {"message": "Damnnnn", "data": "No"};
        }
        if (e.response?.statusCode == 401) {}
        return handler.next(e);
      },
    ));
  }

  /// GET Request
  Future<dynamic> getRequest(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// POST Request
  Future<dynamic> postRequest(
      String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// Handle response
  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw Exception(response.data["message"]);
      case 500:
        throw Exception("Internal Server Error.");
      default:
        throw Exception("Unexpected Error: ${response.statusCode}");
    }
  }

  /// Handle errors/exceptions
  dynamic _handleError(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout) {
      throw Exception("Connection Timeout. Please try again.");
    } else if (error.type == DioExceptionType.receiveTimeout) {
      throw Exception("Receive Timeout. Please try again.");
    } else if (error.type == DioExceptionType.badResponse) {
      throw Exception("Server Error: ${error.response?.statusCode}");
    } else if (error.error is SocketException) {
      throw Exception("No Internet Connection.");
    } else {
      throw Exception("Unexpected Error: ${error.message}");
    }
  }
}
