import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = "https://youtube-media-downloader.p.rapidapi.com";
  static final Dio _dio = Dio();

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint',
        options: Options(headers: {
          'x-rapidapi-key':
              'd9e2dd6ad8mshef8427364eaa095p145bf8jsn399c2fbc6f00',
          'x-rapidapi-host': 'youtube-media-downloader.p.rapidapi.com'
        }));
    return response.data;
  }
}
