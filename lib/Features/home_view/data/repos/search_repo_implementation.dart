import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:youtube_clone/Core/errors/failures.dart';
import 'package:youtube_clone/Core/utils/api_service.dart';
import 'package:youtube_clone/Features/home_view/data/models/search_model/search_model.dart';
import 'package:youtube_clone/Features/home_view/data/repos/search_repo.dart';

class SearchRepoImplementation implements SearchRepo {
  final ApiService apiService;

  SearchRepoImplementation({required this.apiService});
  @override
  Future<Either<Failure, SearchModel>> getVideo({required String value}) async {
    try {
      var data =
          await apiService.get(endPoint: '/v2/search/videos?keyword=$value');
      return Right(SearchModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
