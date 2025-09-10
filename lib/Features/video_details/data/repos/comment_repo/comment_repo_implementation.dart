import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:youtube_clone/Core/errors/failures.dart';
import 'package:youtube_clone/Core/utils/api_service.dart';
import 'package:youtube_clone/Features/video_details/data/models/comment_model/comment_model.dart';
import 'package:youtube_clone/Features/video_details/data/repos/comment_repo/comment_repo.dart';

class CommentRepoImplementation implements CommentRepo {
  final ApiService apiService;
  CommentRepoImplementation({required this.apiService});
  @override
  Future<Either<Failure, CommentModel>> getComment({required String id}) async {
    try {
      var data =
          await apiService.get(endPoint: '/v2/video/comments?videoId=$id');
      return Right(CommentModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
