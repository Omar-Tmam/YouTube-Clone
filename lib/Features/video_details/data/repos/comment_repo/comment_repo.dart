import 'package:dartz/dartz.dart';
import 'package:youtube_clone/Core/errors/failures.dart';
import 'package:youtube_clone/Features/video_details/data/models/comment_model/comment_model.dart';

abstract class CommentRepo {
  Future<Either<Failure, CommentModel>> getComment({required String id});
}
