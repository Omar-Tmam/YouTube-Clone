import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:youtube_clone/Core/errors/failures.dart';
import 'package:youtube_clone/Core/utils/api_service.dart';
import 'package:youtube_clone/Features/video_details/data/models/related_model/related_model.dart';
import 'package:youtube_clone/Features/video_details/data/repos/related_repo/related_repo.dart';

class RelatedRepoImplementation implements RelatedRepo {
  final ApiService apiService;

  RelatedRepoImplementation({required this.apiService});
  @override
  Future<Either<Failure, RelatedModel>> getRelated({required String id}) async {
    try {
      var data = await apiService.get(endPoint: '/v2/video/related?videoId=$id');
      return Right(RelatedModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
