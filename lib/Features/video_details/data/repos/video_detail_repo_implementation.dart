import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:youtube_clone/Core/errors/failures.dart';
import 'package:youtube_clone/Core/utils/api_service.dart';
import 'package:youtube_clone/Features/video_details/data/models/video_detail_model/video_detail_model.dart';
import 'package:youtube_clone/Features/video_details/data/repos/video_detail_repo.dart';

class VideoDetailRepoImplementation implements VideoDetailRepo {
  final ApiService apiService;

  VideoDetailRepoImplementation({required this.apiService});
  @override
  Future<Either<Failure, VideoDetailModel>> getVideoDetails(
      {required String videoId}) async {
    try {
      var data =
          await apiService.get(endPoint: '/v2/video/details?videoId=$videoId');
      return Right(VideoDetailModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
