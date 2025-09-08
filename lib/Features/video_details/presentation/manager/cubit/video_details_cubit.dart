import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:youtube_clone/Features/video_details/data/models/video_detail_model/video_detail_model.dart';
import 'package:youtube_clone/Features/video_details/data/repos/video_detail_repo.dart';

part 'video_details_state.dart';

class VideoDetailsCubit extends Cubit<VideoDetailsState> {
  VideoDetailsCubit(this.videoDetailRepo) : super(VideoDetailsInitial());
  final VideoDetailRepo videoDetailRepo;
  Future<void> getVideoDetail(String id) async {
    emit(VideoDetailsLoading());
    var data = await videoDetailRepo.getVideoDetails(videoId: id);
    data.fold((failure) {
      emit(VideoDetailsFailure(errMessage: failure.errMessage));
    }, (data) {
      emit(VideoDetailsSuccess(videoDetailModel: data));
    });
  }
}
