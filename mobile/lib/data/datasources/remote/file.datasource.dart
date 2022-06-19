import 'package:mobile/core/utils/dio/dio_provider.dart';

class FileRemoteDataSource {
  Future<HttpRequestResponse> downloadFile(String url) async {
    return await DioProvider.download(url: url);
  }
}
