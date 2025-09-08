import 'package:dartz/dartz.dart';
import 'package:youtube_clone/Core/errors/failures.dart';
import 'package:youtube_clone/Features/video_details/data/models/video_detail_model/video_detail_model.dart';

abstract class VideoDetailRepo {
   Future<Either<Failure, VideoDetailModel>> getVideoDetails({required String videoId});
}