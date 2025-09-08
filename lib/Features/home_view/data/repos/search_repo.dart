import 'package:dartz/dartz.dart';
import 'package:youtube_clone/Core/errors/failures.dart';
import 'package:youtube_clone/Features/home_view/data/models/search_model/search_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, SearchModel>> getVideo({required String value});
}
