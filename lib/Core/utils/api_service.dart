import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = "https://youtube-media-downloader.p.rapidapi.com";
  static final Dio _dio = Dio();

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint',
        options: Options(headers: {
          'x-rapidapi-key':
              'e568d19a3cmshec63163b52ea7cbp1af65ejsn8073df7b1902',
          'x-rapidapi-host': 'youtube-media-downloader.p.rapidapi.com'
        }));
    return response.data;
  }
}
