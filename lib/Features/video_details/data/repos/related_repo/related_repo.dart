import 'package:dartz/dartz.dart';
import 'package:youtube_clone/Core/errors/failures.dart';
import 'package:youtube_clone/Features/video_details/data/models/related_model/related_model.dart';

abstract class RelatedRepo {
  Future<Either<Failure, RelatedModel>> getRelated({required String id});
}
