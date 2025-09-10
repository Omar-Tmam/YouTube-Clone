import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = "https://youtube-media-downloader.p.rapidapi.com";
  static final Dio _dio = Dio();

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint',
        options: Options(headers: {
          'x-rapidapi-key':
              '4a605f3be5mshb86dc34b8aa14ecp12474cjsn9122fb4804ca',
          'x-rapidapi-host': 'youtube-media-downloader.p.rapidapi.com'
        }));
    return response.data;
  }
}
