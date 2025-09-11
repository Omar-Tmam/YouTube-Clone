import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = "https://youtube-media-downloader.p.rapidapi.com";
  static final Dio _dio = Dio();

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint',
        options: Options(headers: {
          'x-rapidapi-key':
              '5ce73a1a6amshf10388a473a52a9p140c04jsna5da2798e384',
          'x-rapidapi-host': 'youtube-media-downloader.p.rapidapi.com'
        }));
    return response.data;
  }
}
