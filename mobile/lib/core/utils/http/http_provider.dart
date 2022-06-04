import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/core/constants/key_env.dart';

import 'package:mobile/core/utils/http/exceptions.dart';
import 'package:mobile/core/utils/http/logging_request.dart';

abstract class HttpProvider {
  static final Dio _dio = Dio()..interceptors.add(LoggingRequest());

  static Future<T> get<T>({
    required String url,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final String endpoint = '${dotenv.env[KeyEnv.apiUrl]}/api$url';
      final Response response =
          await _dio.get(endpoint, queryParameters: queryParams);
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
  }

  static Future<T> post<T>({
    required String url,
    Map<String, dynamic>? formBody,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final String endpoint = '${dotenv.env['API_URL']}/api$url';
      final Response response = await _dio.post(
        endpoint,
        data: formBody,
        queryParameters: queryParams,
      );

      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
  }

  static Future<T> patch<T>({
    required String url,
    Map<String, dynamic>? formBody,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final String endpoint = '${dotenv.env['API_URL']}/api$url}';
      final Response response = await _dio.patch(endpoint, data: formBody);
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
  }

  static T _returnResponse<T>(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw BadRequestException(response.data);
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 404:
        throw BadRequestException('Not found');
      case 500:
        throw FetchDataException('Internal server error');
      default:
        throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}',
        );
    }
  }
}
