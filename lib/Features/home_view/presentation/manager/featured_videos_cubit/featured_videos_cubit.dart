import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:youtube_clone/Features/home_view/data/models/search_model/search_model.dart';
import 'package:youtube_clone/Features/home_view/data/repos/search_repo.dart';

part 'featured_videos_state.dart';

class FeaturedVideosCubit extends Cubit<FeaturedVideosState> {
  FeaturedVideosCubit(this.searchRepo) : super(FeaturedVideosInitial());
  final SearchRepo searchRepo;
  Future<void> featuredVideos() async {
    emit(FeaturedVideosLoading());
    var result = await searchRepo.getFeatured();
    result.fold((failure) {
      emit(FeaturedVideosFailure(errMessage: failure.errMessage));
    }, (searchModel) {
      emit(FeaturedVideosSuccess(videos: [searchModel]));
    });
  }
}
