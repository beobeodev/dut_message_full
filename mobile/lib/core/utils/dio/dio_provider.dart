import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/core/constants/key_env.dart';
import 'package:mobile/core/utils/dio/logging_request.dart';
import 'package:path_provider/path_provider.dart';

abstract class DioProvider {
  static final Dio _dio = Dio()..interceptors.add(LoggingRequest());

  static Future<dynamic> get({
    required String url,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    final String endpoint = '${dotenv.env[KeyEnv.apiUrl]}$url';
    final Response response = await _dio.get(
      endpoint,
      queryParameters: queryParams,
      options: Options(headers: headers),
    );

    return response.data;
  }

  static Future<dynamic> post({
    required String url,
    Map<String, dynamic>? formBody,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    final String endpoint = '${dotenv.env['API_URL']}$url';
    final Response response = await _dio.post(
      endpoint,
      data: formBody,
      queryParameters: queryParams,
      options: Options(headers: headers),
    );

    return response.data;
  }

  static Future<dynamic> patch({
    required String url,
    Map<String, dynamic>? formBody,
    Map<String, dynamic>? queryParams,
  }) async {
    final String endpoint = '${dotenv.env['API_URL']}$url}';
    final Response response = await _dio.patch(endpoint, data: formBody);
    return response.data;
  }

  static Future<dynamic> downloadFile({
    required String url,
    String? savedPath,
  }) async {
    savedPath ??= (await getApplicationSupportDirectory()).path;

    final Response response = await _dio.download(url, savedPath);

    return response.data;
  }
}
